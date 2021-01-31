package com.kgc.entity;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class GoodtypeExample implements Serializable {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public GoodtypeExample() {
        oredCriteria = new ArrayList<Criteria>();
    }

    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    public String getOrderByClause() {
        return orderByClause;
    }

    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    public boolean isDistinct() {
        return distinct;
    }

    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    protected abstract static class GeneratedCriteria {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<Criterion>();
        }

        public boolean isValid() {
            return criteria.size() > 0;
        }

        public List<Criterion> getAllCriteria() {
            return criteria;
        }

        public List<Criterion> getCriteria() {
            return criteria;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteria.add(new Criterion(condition));
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value));
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value1, value2));
        }

        public Criteria andGoodtypeIdIsNull() {
            addCriterion("goodType_id is null");
            return (Criteria) this;
        }

        public Criteria andGoodtypeIdIsNotNull() {
            addCriterion("goodType_id is not null");
            return (Criteria) this;
        }

        public Criteria andGoodtypeIdEqualTo(Integer value) {
            addCriterion("goodType_id =", value, "goodtypeId");
            return (Criteria) this;
        }

        public Criteria andGoodtypeIdNotEqualTo(Integer value) {
            addCriterion("goodType_id <>", value, "goodtypeId");
            return (Criteria) this;
        }

        public Criteria andGoodtypeIdGreaterThan(Integer value) {
            addCriterion("goodType_id >", value, "goodtypeId");
            return (Criteria) this;
        }

        public Criteria andGoodtypeIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("goodType_id >=", value, "goodtypeId");
            return (Criteria) this;
        }

        public Criteria andGoodtypeIdLessThan(Integer value) {
            addCriterion("goodType_id <", value, "goodtypeId");
            return (Criteria) this;
        }

        public Criteria andGoodtypeIdLessThanOrEqualTo(Integer value) {
            addCriterion("goodType_id <=", value, "goodtypeId");
            return (Criteria) this;
        }

        public Criteria andGoodtypeIdIn(List<Integer> values) {
            addCriterion("goodType_id in", values, "goodtypeId");
            return (Criteria) this;
        }

        public Criteria andGoodtypeIdNotIn(List<Integer> values) {
            addCriterion("goodType_id not in", values, "goodtypeId");
            return (Criteria) this;
        }

        public Criteria andGoodtypeIdBetween(Integer value1, Integer value2) {
            addCriterion("goodType_id between", value1, value2, "goodtypeId");
            return (Criteria) this;
        }

        public Criteria andGoodtypeIdNotBetween(Integer value1, Integer value2) {
            addCriterion("goodType_id not between", value1, value2, "goodtypeId");
            return (Criteria) this;
        }

        public Criteria andGoodtypeNameIsNull() {
            addCriterion("goodType_name is null");
            return (Criteria) this;
        }

        public Criteria andGoodtypeNameIsNotNull() {
            addCriterion("goodType_name is not null");
            return (Criteria) this;
        }

        public Criteria andGoodtypeNameEqualTo(String value) {
            addCriterion("goodType_name =", value, "goodtypeName");
            return (Criteria) this;
        }

        public Criteria andGoodtypeNameNotEqualTo(String value) {
            addCriterion("goodType_name <>", value, "goodtypeName");
            return (Criteria) this;
        }

        public Criteria andGoodtypeNameGreaterThan(String value) {
            addCriterion("goodType_name >", value, "goodtypeName");
            return (Criteria) this;
        }

        public Criteria andGoodtypeNameGreaterThanOrEqualTo(String value) {
            addCriterion("goodType_name >=", value, "goodtypeName");
            return (Criteria) this;
        }

        public Criteria andGoodtypeNameLessThan(String value) {
            addCriterion("goodType_name <", value, "goodtypeName");
            return (Criteria) this;
        }

        public Criteria andGoodtypeNameLessThanOrEqualTo(String value) {
            addCriterion("goodType_name <=", value, "goodtypeName");
            return (Criteria) this;
        }

        public Criteria andGoodtypeNameLike(String value) {
            addCriterion("goodType_name like", value, "goodtypeName");
            return (Criteria) this;
        }

        public Criteria andGoodtypeNameNotLike(String value) {
            addCriterion("goodType_name not like", value, "goodtypeName");
            return (Criteria) this;
        }

        public Criteria andGoodtypeNameIn(List<String> values) {
            addCriterion("goodType_name in", values, "goodtypeName");
            return (Criteria) this;
        }

        public Criteria andGoodtypeNameNotIn(List<String> values) {
            addCriterion("goodType_name not in", values, "goodtypeName");
            return (Criteria) this;
        }

        public Criteria andGoodtypeNameBetween(String value1, String value2) {
            addCriterion("goodType_name between", value1, value2, "goodtypeName");
            return (Criteria) this;
        }

        public Criteria andGoodtypeNameNotBetween(String value1, String value2) {
            addCriterion("goodType_name not between", value1, value2, "goodtypeName");
            return (Criteria) this;
        }
    }

    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }

    public static class Criterion {
        private String condition;

        private Object value;

        private Object secondValue;

        private boolean noValue;

        private boolean singleValue;

        private boolean betweenValue;

        private boolean listValue;

        private String typeHandler;

        public String getCondition() {
            return condition;
        }

        public Object getValue() {
            return value;
        }

        public Object getSecondValue() {
            return secondValue;
        }

        public boolean isNoValue() {
            return noValue;
        }

        public boolean isSingleValue() {
            return singleValue;
        }

        public boolean isBetweenValue() {
            return betweenValue;
        }

        public boolean isListValue() {
            return listValue;
        }

        public String getTypeHandler() {
            return typeHandler;
        }

        protected Criterion(String condition) {
            super();
            this.condition = condition;
            this.typeHandler = null;
            this.noValue = true;
        }

        protected Criterion(String condition, Object value, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.typeHandler = typeHandler;
            if (value instanceof List<?>) {
                this.listValue = true;
            } else {
                this.singleValue = true;
            }
        }

        protected Criterion(String condition, Object value) {
            this(condition, value, null);
        }

        protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.secondValue = secondValue;
            this.typeHandler = typeHandler;
            this.betweenValue = true;
        }

        protected Criterion(String condition, Object value, Object secondValue) {
            this(condition, value, secondValue, null);
        }
    }
}