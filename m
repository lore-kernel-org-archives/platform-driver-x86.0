Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A9FD74C14;
	Sun, 23 Nov 2025 01:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763861548; cv=none; b=Srf/BvQgFVXtueS2fhS8+EKZVsEfvx8R6IDFd01Y0Uc3//CWuaptNLVXeECX+dXRsNtXwwvyNFhaaYSAGfc9SBNUdLpWF7M3/4tTBNTdfWQt0IVNeQRqWwhyUB7M0MeLO57AWOppjlW6Uof9+ekBoLRrSrj3VqhhJ4jMwXxPJvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763861548; c=relaxed/simple;
	bh=7zzmZNJA/qYtngMEJ3+SEf6bJBKMxnSs3zVQoknq5NI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c3EWOxRGcJE3gWZKrQj/Nm6qwWREeunFb584sQrpkb5Qfs9ZbZyIFnuGFiRD6ga/2++1FCWwKYS0OSjlSPlQdwy3OOxcFODapdSNxuF/q6qo1JkzEXqKyJJxXiqm7Run7qCQ32n+kTjla/8cUTWTXvKgsMk3njuhJGoVr3mzCbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=nM9PbblS; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="nM9PbblS"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=aXL/XTTixCTBk2wpak7HceDGrKEGNUNSaNZs8hIDyN4=; b=nM9PbblSGj/crOhjJaHkhpLdPE
	MyjNajVfHQ/8CDcGEYx5vNNnmzPW+rwxcIB997M04wVo9nG2h/WLEhcN9qrHHEaUfPcb9PS/yktYV
	8d8WtCWkt/OnUHUbkygCRrRAcW+EDufKZYJoEms7AgtaskiTA5b+vStYeO/VjvZnqL6fApTLfLqIA
	dHwbjmM0zXZy+TeI5ss07hJdJXpEd7/BY0rFEDRo1bmhav8gvx+90cFvzWyN6e+er4U3LnLZpEG3/
	LbKup6Q04DdRbYEYxOEXCQKbRM4ZYLSmIJ+IF0rX44eUA1zIgSW5/0ja/nshaSfcRi+yAietyg6/g
	dkC3NQmA==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMyxd-0000000A1t2-0l9s;
	Sun, 23 Nov 2025 01:32:17 +0000
Message-ID: <e57d7ade-cea7-43e2-91db-585485025b91@infradead.org>
Date: Sat, 22 Nov 2025 17:32:16 -0800
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 9/9] platform/wmi: Update driver development guide
To: Armin Wolf <W_Armin@gmx.de>, hansg@kernel.org,
 ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux@weissschuh.net, Dell.Client.Kernel@dell.com, corbet@lwn.net,
 linux-doc@vger.kernel.org
References: <20251122203803.6154-1-W_Armin@gmx.de>
 <20251122203803.6154-10-W_Armin@gmx.de>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20251122203803.6154-10-W_Armin@gmx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/22/25 12:38 PM, Armin Wolf wrote:
> New WMI drivers should use the new buffer-based WMI API instead of
> the deprecated ACPI-based API. Update the driver development guide
> to recommend the buffer-based API to driver developers and explain
> the purpose of struct wmi_buffer.
> 
> Also update the ACPI interface documentation to describe the
> conversion rules for converting ACPI objects into WMI buffers.
> 
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
> ---
>  Documentation/wmi/acpi-interface.rst          | 68 +++++++++++++++++
>  .../wmi/driver-development-guide.rst          | 76 +++++++++++++------
>  2 files changed, 121 insertions(+), 23 deletions(-)
> 
> diff --git a/Documentation/wmi/acpi-interface.rst b/Documentation/wmi/acpi-interface.rst
> index 1ef003b033bf..6dad191ac59d 100644
> --- a/Documentation/wmi/acpi-interface.rst
> +++ b/Documentation/wmi/acpi-interface.rst
> @@ -104,3 +104,71 @@ holding the notification ID of the event. This method should be evaluated every
>  time an ACPI notification is received, since some ACPI implementations use a
>  queue to store WMI event data items. This queue will overflow after a couple
>  of WMI events are received without retrieving the associated WMI event data.
> +
> +Conversion rules for ACPI data types
> +------------------------------------
> +
> +Consumers of the ACPI-WMI interface use binary buffers to exchange data with the WMI driver core,
> +with the internal structure of the buffer being only know to the consumers. The WMI driver core is
> +thus responsible for converting the data inside the buffer into an appropriate ACPI data type for
> +consumtion by the ACPI firmware. Additionally, any data returned by the various ACPI methods needs

   consumption (or: use)

> +to be converted back into a binary buffer.
> +
> +The layout of said buffers is defined by the MOF description of the WMI method or data block in
> +question [1]_:
> +
> +=============== ======================================================================= =========
> +Data Type       Layout                                                                  Alignment
> +=============== ======================================================================= =========
> +``string``      Starts with a unsigned 16-bit little endian integer specifying          2 bytes

                               an unsigned

> +                the length of the string data in bytes, followed by the string data
> +                encoded as UTF-16LE with **optional** nul termination and padding.

                                                         NUL

> +                Keep in mind that some firmware implementations might depend on the
> +                terminating nul character to be present. Also the padding should
                               NUL

> +                always be performed with nul characters.
                                            NUL

> +``boolean``     Single byte where 0 means ``false`` and nonzero means ``true``.         1 byte
> +``sint8``       Signed 8-bit integer.                                                   1 byte
> +``uint8``       Unsigned 8-bit integer.                                                 1 byte
> +``sint16``      Signed 16-bit little endian integer.                                    2 byte
> +``uint16``      Unsigned 16-bit little endian integer.                                  2 byte
> +``sint32``      Signed 32-bit little endian integer.                                    4 byte
> +``uint32``      Unsigned 32-bit little endian integer.                                  4 byte

Above 4 lines should end with "bytes".

> +``sint64``      Signed 64-bit little endian integer.                                    8 bytes
> +``uint64``      Unsigned 64-bit little endian integer.                                  8 bytes
> +``datetime``    A fixed-length 25-character UTF-16LE string with the format             2 bytes
> +                *yyyymmddhhmmss.mmmmmmsutf* where *yyyy* is the 4-digit year, *mm* is
> +                the 2-digit month, *dd* is the 2-digit day, *hh* is the 2-digit hour
> +                based on a 24-hour clock, *mm* is the 2-digit minute, *ss* is the
> +                2-digit second, *mmmmmm* is the 6-digit microsecond, *s* is a plus or
> +                minus character depending on whether *utc* is a positive or negative

                                                         ^^^ utf: or 5 lines up should be utc

> +                offset from UTC (or a colon if the date is an interval). Unpopulated
> +                fields should be filled with asterisks.
> +=============== ======================================================================= =========
> +
> +Arrays should be aligned based on the alignment of their base type, while objects should be
> +aligned based on the largest alignment of an element inside them.
> +
> +All buffers returned by the WMI driver core are 8-byte aligned. When converting ACPI data types
> +into such buffers the following conversion rules apply:
> +
> +=============== ============================================================
> +ACPI Data Type  Converted into
> +=============== ============================================================
> +Buffer          Copied as-is.
> +Integer         Converted into a ``uint32``.
> +String          Converted into a ``string`` with a terminating nul character

                                                                  NUL

> +                to match the behavior the of the Windows driver.
> +Package         Each element inside the package is converted with alignment
> +                of the resulting data types being respected. Nested packages
> +                are not allowed.
> +=============== ============================================================
> +
> +The Windows driver does attempt to handle nested packages, but this results in internal data
> +structures (``_ACPI_METHOD_ARGUMENT_V1``) erroneously being copied into the resulting buffer.
> +ACPI firmware implementations should thus not return nested packages from ACPI methods
> +associated with the ACPI-WMI interface.
> +
> +References
> +==========
> +
> +.. [1] https://learn.microsoft.com/en-us/windows-hardware/drivers/kernel/driver-defined-wmi-data-items
> diff --git a/Documentation/wmi/driver-development-guide.rst b/Documentation/wmi/driver-development-guide.rst
> index 99ef21fc1c1e..9019661180a0 100644
> --- a/Documentation/wmi/driver-development-guide.rst
> +++ b/Documentation/wmi/driver-development-guide.rst
> @@ -69,7 +69,7 @@ to matching WMI devices using a struct wmi_device_id table:
>          .probe = foo_probe,
>          .remove = foo_remove,         /* optional, devres is preferred */
>          .shutdown = foo_shutdown,     /* optional, called during shutdown */
> -        .notify = foo_notify,         /* optional, for event handling */
> +        .notify_new = foo_notify,     /* optional, for event handling */
>          .no_notify_data = true,       /* optional, enables events containing no additional data */
>          .no_singleton = true,         /* required for new WMI drivers */
>    };
> @@ -89,9 +89,9 @@ the WMI device and put it in a well-known state for the WMI driver to pick up la
>  or kexec. Most WMI drivers need no special shutdown handling and can thus omit this callback.
>  
>  Please note that new WMI drivers are required to be able to be instantiated multiple times,
> -and are forbidden from using any deprecated GUID-based WMI functions. This means that the
> -WMI driver should be prepared for the scenario that multiple matching WMI devices are present
> -on a given machine.
> +and are forbidden from using any deprecated GUID-based and ACPI-based WMI functions. This means

                                         I would say:     or

> +that the WMI driver should be prepared for the scenario that multiple matching WMI devices are
> +present on a given machine.
>  
>  Because of this, WMI drivers should use the state container design pattern as described in
>  Documentation/driver-api/driver-model/design-patterns.rst.
> @@ -103,38 +103,37 @@ Documentation/driver-api/driver-model/design-patterns.rst.
>  WMI method drivers
>  ------------------
>  
> -WMI drivers can call WMI device methods using wmidev_evaluate_method(), the
> -structure of the ACPI buffer passed to this function is device-specific and usually
> -needs some tinkering to get right. Looking at the ACPI tables containing the WMI
> -device usually helps here. The method id and instance number passed to this function
> -are also device-specific, looking at the decoded Binary MOF is usually enough to
> -find the right values.
> +WMI drivers can call WMI device methods using wmidev_invoke_method(). For each WMI method
> +invocation the WMI driver needs to provide the instance number and the method ID, as well as
> +a buffer with the method arguments and optionally a buffer for the results.
>  
> -The maximum instance number can be retrieved during runtime using wmidev_instance_count().
> +The layout of said buffers is device-specific and described by the Binary MOF data associated
> +with a given WMI device. Said Binary MOF data also describes the method ID of a given WMI method
> +with the ``WmiMethodId`` qualifier. WMI devices exposing WMI methods usually expose only a single
> +instance (instance number 0), but in theory can expose multiple instances as well. In such a case
> +the number of instances can be retrieved using wmidev_instance_count().
>  
> -Take a look at drivers/platform/x86/inspur_platform_profile.c for an example WMI method driver.
> +Take a look at drivers/platform/x86/intel/wmi/thunderbolt.c for an example WMI method driver.
>  
>  WMI data block drivers
>  ----------------------
>  
> -WMI drivers can query WMI device data blocks using wmidev_block_query(), the
> -structure of the returned ACPI object is again device-specific. Some WMI devices
> -also allow for setting data blocks using wmidev_block_set().
> +WMI drivers can query WMI data blocks using wmidev_query_block(), the layout of thereturned

                                                                 (). The layout of the returned

> +buffer is again device-specific and described by the Binary MOF data. Some WMI data blocks are
> +also writeable and can be set using wmidev_set_block(). The number of data block instances can
> +again be retrieved using wmidev_instance_count().
>  
> -The maximum instance number can also be retrieved using wmidev_instance_count().
> -
> -Take a look at drivers/platform/x86/intel/wmi/sbl-fw-update.c for an example
> -WMI data block driver.
> +Take a look at drivers/platform/x86/intel/wmi/sbl-fw-update.c for an example WMI data block driver.
>  
>  WMI event drivers
>  -----------------
>  
> -WMI drivers can receive WMI events via the notify() callback inside the struct wmi_driver.
> +WMI drivers can receive WMI events via the notify_new() callback inside the struct wmi_driver.
>  The WMI subsystem will then take care of setting up the WMI event accordingly. Please note that
> -the structure of the ACPI object passed to this callback is device-specific, and freeing the
> -ACPI object is being done by the WMI subsystem, not the driver.
> +the layout of the buffer passed to this callback is device-specific, and freeing of the buffer
> +is being done by the WMI subsystem itself, not the driver.

   is done by

>  
> -The WMI driver core will take care that the notify() callback will only be called after
> +The WMI driver core will take care that the notify_new() callback will only be called after
>  the probe() callback has been called, and that no events are being received by the driver
>  right before and after calling its remove() or shutdown() callback.
>  
> @@ -146,6 +145,36 @@ the ``no_notify_data`` flag inside struct wmi_driver should be set to ``true``.
>  
>  Take a look at drivers/platform/x86/xiaomi-wmi.c for an example WMI event driver.
>  
> +Exchanging data with the WMI driver core
> +----------------------------------------
> +
> +WMI drivers can exchange data with the WMI driver core using struct wmi_buffer. The internal
> +structure of those buffers is device-specific and only known by the WMI driver. Because of this
> +the WMI driver itself is responsible for parsing and validating the data received from its
> +WMI device.
> +
> +The strcture of said buffers is described by the MOF data associated with the WMI device in

       structure

> +question. When such a buffer contains multiple data items it usually makes sense to define a
> +C structure and use it during parsing. Since the WMI driver core guarantees that all buffers
> +received from a WMI device are aligned on a 8-byte boundary, WMI drivers can simply perform

                                          on an 8-byte

> +a cast between the WMI buffer data and this C structure.
> +
> +This however should only be done after the size of the buffer was verified to be large enough
> +to hold the whole C structure. WMI drivers should reject undersized buffers as they are usually
> +send by the WMI device to signal an internal error. Oversized buffers however should be accepted

   sent

> +to emulate the behavior of the Windows WMI implementation.
> +
> +When defining a C structure for parsing WMI buffers the alignment of the data items should be
> +respected. This is especially important for 64-bit integers as those have different alignments
> +on 64-bit (8-byte alignment) and 32-bit (4-byte alignment) architectures. It is thus a good idea
> +to manually specify the alignment of such data items or mark the whole structure as packed when
> +appropriate. Integer data items in general are little-endian integers and should be marked as
> +such using ``__le64`` and friends. When parsing WMI string data items the struct wmi_string should
> +be used as WMI strings have a different layout than C strings.
> +
> +See Documentation/wmi/acpi-interface.rst for more information regarding the binary format
> +of WMI data items.
> +
>  Handling multiple WMI devices at once
>  -------------------------------------
>  
> @@ -170,6 +199,7 @@ Things to avoid
>  When developing WMI drivers, there are a couple of things which should be avoided:
>  
>  - usage of the deprecated GUID-based WMI interface which uses GUIDs instead of WMI device structs
> +- usage of the deprecated ACPI-based WMI interface which uses ACPI objects instead of plain buffers
>  - bypassing of the WMI subsystem when talking to WMI devices
>  - WMI drivers which cannot be instantiated multiple times.
>  

Otherwise LGTM. Thanks.

-- 
~Randy

