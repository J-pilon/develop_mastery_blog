import React from 'react'
import PropTypes from 'prop-types'

const ErrorBlock = props => {
  return (
    <div className='error-block'>
        {props.message}
    </div>
  )
}

ErrorBlock.propTypes = {
    message: PropTypes.string,
}

export default ErrorBlock