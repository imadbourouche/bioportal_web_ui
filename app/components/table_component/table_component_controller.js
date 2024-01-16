import {Controller} from "@hotwired/stimulus"
import DataTable from 'datatables.net-dt';


// Connects to data-controller="table-component"
export default class extends Controller {
    static values = {
        sort: String,
        defaultsortcolumn: String,
        paging: String,
        Searching: String
    }
    connect(){    
        let table_component
        table_component = this.element.childNodes[1]
        let default_sort_column
        default_sort_column = parseInt(this.defaultsortcolumnValue, 10)
        if (this.sortValue === 'true'){
            let table = new DataTable('#'+table_component.id, {
                paging: this.pagingValue === 'true',
                info: false,
                searching: this.searchingValue === 'true',
                autoWidth: true,
                order: [[default_sort_column, 'desc']]
            });
        }
    }
}