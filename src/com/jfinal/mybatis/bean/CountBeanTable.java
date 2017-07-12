package com.jfinal.mybatis.bean;

import java.util.List;

import org.apache.commons.lang.StringUtils;

public class CountBeanTable extends CountBean {
    private static final long serialVersionUID = 1L;

    protected String tableName;
    
    protected List<String> requestColumnNameList;
    
    protected List<String> selectColumnNameList;
    
    //h5AccessNum, pcAccessNum, h5PraiseNum, pcPraiseNum, h5ShareNum, pcShareNum, h5PlayNum
    //pcPlayNum, h5VotingNum, pcVotingNum, votingNum, h5GoodClickNum, pcGoodClickNum, h5BadClickNum,
    //pcBadClickNum, h5DownNum, pcDownNum
    //可以允许前端接口访问的字段
    protected String requestColumnNames;

    //查询的字段，包括字段，字段相加的总数（h5AccessNum+pcAccessNum=accessNum）
    protected String selectColumnNames;

    public String getTableName() {
		return tableName;
	}

	public void setTableName(String tableName) {
		this.tableName = tableName;
	}

	public List<String> getRequestColumnNameList() {
		return requestColumnNameList;
	}

	public void setRequestColumnNameList(List<String> requestColumnNameList) {
		this.requestColumnNameList = requestColumnNameList;
	}

	public List<String> getSelectColumnNameList() {
		return selectColumnNameList;
	}

	public void setSelectColumnNameList(List<String> selectColumnNameList) {
		this.selectColumnNameList = selectColumnNameList;
	}

	//this.columnNames = "h5AccessNum, pcAccessNum, h5PraiseNum, pcPraiseNum.....";
	/*select id, h5AccessNum, pcAccessNum, h5PraiseNum, pcPraiseNum from ....
	--> select id, ${columnNames} from ....
	*/
	public String getRequestColumnNames() {
		if(requestColumnNames==null && requestColumnNameList!=null){
			this.requestColumnNames = StringUtils.join(this.requestColumnNameList, ",");
		}
		return requestColumnNames;
	}

	public void setRequestColumnNames(String requestColumnNames) {
		this.requestColumnNames = requestColumnNames;
	}

	//this.columnNames = "accessNum, praiseNum.....";
	public String getSelectColumnNames() {
		if(selectColumnNames==null && selectColumnNameList!=null){
			this.selectColumnNames = StringUtils.join(this.selectColumnNameList, ",");
		}
		return selectColumnNames;
	}

	public void setSelectColumnNames(String selectColumnNames) {
		this.selectColumnNames = selectColumnNames;
	}

	@Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", id=").append(id);
        sb.append(", tableName=").append(tableName);
        sb.append(", requestColumnNames=").append(requestColumnNames);
        sb.append(", selectColumnNames=").append(selectColumnNames);
        sb.append(", createUser=").append(createUser);
        sb.append(", createDate=").append(createDate);
        sb.append(", updateUser=").append(updateUser);
        sb.append(", updateDate=").append(updateDate);
        sb.append(", deleteFlag=").append(deleteFlag);
        sb.append("]");
        return sb.toString();
    }
}
