# frozen_string_literal: true

class CategoryPolicy
  attr_reader :user, :record
  
  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    return @user.has_role? :admin
  end

  def show?
    return @user.has_role? :admin
  end

  def create?
    return @user.has_role? :admin
  end

  def new?
    create?
  end

  def update?
    return @user.has_role? :admin
  end

  def edit?
    update?
  end

  def destroy?
    return @user.has_role? :admin
  end

  class Scope
    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      raise NotImplementedError, "You must define #resolve in #{self.class}"
    end

    private

    attr_reader :user, :scope
  end
end
