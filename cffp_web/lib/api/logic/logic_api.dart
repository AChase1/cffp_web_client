class LogicApi {
  /// use to make any network call to the database in the client
  ///
  /// ensures authentication using tokens
  void makeNetworkCall<T>() {
    /// TODO
    ///
    /// Step 1. => make network call
    ///     Step 1a. => check call response for invalid/expired access token
    ///     Step 1b. => if (token != valid), make another network call to
    ///                 refresh access token using the refresh token
    ///              => upon successful refresh, remake the initial network call
    ///
    /// Step 2. => compute the call's response
    ///         => if (response.hasException), show error message with ToastFeedback.error(errorMessage)
    ///         => if (response.hasData), use T.parseJson(response) to assign response data
  }
}
