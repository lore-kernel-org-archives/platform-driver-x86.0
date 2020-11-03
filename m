Return-Path: <SRS0=a5Ee=EJ=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62C69C388F2
	for <platform-driver-x86@archiver.kernel.org>; Tue,  3 Nov 2020 09:35:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DBDB522403
	for <platform-driver-x86@archiver.kernel.org>; Tue,  3 Nov 2020 09:35:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="frsP6QnK"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727068AbgKCJfm (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 3 Nov 2020 04:35:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:38630 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725988AbgKCJfl (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 3 Nov 2020 04:35:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1604396137;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=DsdXEh8WvS7cGT0wIPnyEafR9DqvEqCtLI83NxDnEE0=;
        b=frsP6QnKJZTXlqLd7zhUocpQvicWDRK/i9TJSGO4rdQehKRyKp31r/Od2Td76g7unylht6
        mP4eqvRIi+3mGAGRvBnwqGSDwNv6JHj5itjMUCwg6+xKgnhRjKetbSkIe7+KftCHmahI1z
        FksMWzg+flq7S3gJuZPFx8o1KyTZdxk=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-364-aq8jfBchPCOE5BO1Ubz3qw-1; Tue, 03 Nov 2020 04:35:36 -0500
X-MC-Unique: aq8jfBchPCOE5BO1Ubz3qw-1
Received: by mail-ed1-f71.google.com with SMTP id x15so3831579edr.10
        for <platform-driver-x86@vger.kernel.org>; Tue, 03 Nov 2020 01:35:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=DsdXEh8WvS7cGT0wIPnyEafR9DqvEqCtLI83NxDnEE0=;
        b=Xmn5l9+Z29wOWDojtzj6R0BrEMwoCX6lzoGMLAgksiKZXtln5eGq0nqtVFDy7Cs/d4
         /X38XF89mtJMEiUh5FWrBrIapC/BFmvHM73252pMkDpJ8JOZpJsaaWniZV1Me1x61RDb
         8wBdeqxxBh8RfqJvpanRFBf5x660x4B7caEZP9Oq3iP0+xKXmSrmg0Ys7DOr2ov/xmWy
         9eS18/enjYSlmpnP185yJ/XvWYoBdWWUVrfY4+jjfYluoe0uegDcYBFpn+RRe1Pky1kB
         ak+7IKI1BIEQiz9ES7iiBqAk2aIbqG0n8uRT9+8H857CsiGXRfWLhKUSKvbXBx2+EmCI
         vXww==
X-Gm-Message-State: AOAM533sJiZfKl+6KgPtSD5FxLiv6mmOqUWxhWA36vt9pQFmdV8YW9fy
        jWsn9Is0cZiwUQg0VW4OGsxtVfhDZX/YDQ7dpt+/PKwkPk7msQd9+xyDc2VuAIIvh9+2DejIYPk
        PGBeOdMskrMeljoTsS8xnbUWxM1KfUyN3yg==
X-Received: by 2002:a50:d616:: with SMTP id x22mr20623588edi.221.1604396134656;
        Tue, 03 Nov 2020 01:35:34 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwdvudPNJZMUqF+D4cwSyd8ekY6bBSJInfWs4ZVqpSWLGMRdgMcPw1aHTXS3Hj0tHw3i7TW9Q==
X-Received: by 2002:a50:d616:: with SMTP id x22mr20623552edi.221.1604396134256;
        Tue, 03 Nov 2020 01:35:34 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-6c10-fbf3-14c4-884c.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:6c10:fbf3:14c4:884c])
        by smtp.gmail.com with ESMTPSA id e18sm10683241eja.124.2020.11.03.01.35.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2020 01:35:33 -0800 (PST)
Subject: Re: [PATCH] docs: ABI: sysfs-class-firmware-attributes: solve some
 warnings
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Divya Bharathi <divya27392@gmail.com>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Divya Bharathi <divya.bharathi@dell.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Corbet <corbet@lwn.net>,
        LKML <linux-kernel@vger.kernel.org>,
        Mario Limonciello <mario.limonciello@dell.com>,
        Prasanth KSR <prasanth.ksr@dell.com>,
        mark gross <mgross@linux.intel.com>, dvhart@infradead.org,
        platform-driver-x86@vger.kernel.org
References: <20201029090114.64daf4e3@coco.lan>
 <44b4181b4f772fcc5ec676e72b295c10df35121b.1603963862.git.mchehab+huawei@kernel.org>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <c4005741-8235-b954-8ee6-8a064643c784@redhat.com>
Date:   Tue, 3 Nov 2020 10:35:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <44b4181b4f772fcc5ec676e72b295c10df35121b.1603963862.git.mchehab+huawei@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 10/29/20 10:31 AM, Mauro Carvalho Chehab wrote:
> The Description: tag is missing on some places, causing
> scripts/get_abi.pl warnings:
> 
> 	Warning: file Documentation/ABI/testing/sysfs-class-firmware-attributes#172:
> 		What '/sys/class/firmware-attributes/*/authentication/' doesn't have a description
> 
> Also, some warnings are produced when generating html documentation:
> 
> 	.../Documentation/ABI/testing/sysfs-class-firmware-attributes:2: WARNING: Title underline too short.
> 
> 	Dell specific class extensions
> 	--------------------------
> 	.../Documentation/ABI/testing/sysfs-class-firmware-attributes:2: WARNING: Unexpected indentation.
> 	.../Documentation/ABI/testing/sysfs-class-firmware-attributes:2: WARNING: Unexpected indentation.
> 	.../Documentation/ABI/testing/sysfs-class-firmware-attributes:2: WARNING: Block quote ends without a blank line; unexpected unindent.
> 	.../Documentation/ABI/testing/sysfs-class-firmware-attributes:173: WARNING: Unexpected indentation.
> 	.../Documentation/ABI/testing/sysfs-class-firmware-attributes:173: WARNING: Unexpected indentation.
> 	.../Documentation/ABI/testing/sysfs-class-firmware-attributes:173: WARNING: Block quote ends without a blank line; unexpected unindent.
> 	.../Documentation/ABI/testing/sysfs-class-firmware-attributes:111: WARNING: Inline emphasis start-string without end-string.
> 
> Address the warnings, making it to produce the expected
> output for the documentation ABI.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Thank you for your patch, I've applied this patch to my review-hans 
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Note it will show up in my review-hans branch once I've pushed my
local branch there, which might take a while.

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans


> ---
>  .../testing/sysfs-class-firmware-attributes   | 138 +++++++++++-------
>  1 file changed, 86 insertions(+), 52 deletions(-)
> 
> diff --git a/Documentation/ABI/testing/sysfs-class-firmware-attributes b/Documentation/ABI/testing/sysfs-class-firmware-attributes
> index 04a15c72e883..8ea59fea4709 100644
> --- a/Documentation/ABI/testing/sysfs-class-firmware-attributes
> +++ b/Documentation/ABI/testing/sysfs-class-firmware-attributes
> @@ -12,17 +12,20 @@ Description:
>  		Unless otherwise specified in an attribute description all attributes are optional
>  		and will accept UTF-8 input.
>  
> -		type: A file that can be read to obtain the type of attribute.  This attribute is
> -			mandatory.
> +		type:
> +		    A file that can be read to obtain the type of attribute.
> +		    This attribute is mandatory.
>  
>  		The following are known types:
> +
>  			- enumeration: a set of pre-defined valid values
>  			- integer: a range of numerical values
>  			- string
>  
>  		All attribute types support the following values:
>  
> -		current_value:	A file that can be read to obtain the current
> +		current_value:
> +				A file that can be read to obtain the current
>  				value of the <attr>.
>  
>  				This file can also be written to in order to update the value of a
> @@ -30,59 +33,71 @@ Description:
>  
>  				This attribute is mandatory.
>  
> -		default_value:	A file that can be read to obtain the default
> +		default_value:
> +				A file that can be read to obtain the default
>  				value of the <attr>
>  
> -		display_name:	A file that can be read to obtain a user friendly
> +		display_name:
> +				A file that can be read to obtain a user friendly
>  				description of the at <attr>
>  
> -		display_name_language_code:	A file that can be read to obtain
> +		display_name_language_code:
> +						A file that can be read to obtain
>  						the IETF language tag corresponding to the
>  						"display_name" of the <attr>
>  
>  		"enumeration"-type specific properties:
>  
> -		possible_values:	A file that can be read to obtain the possible
> +		possible_values:
> +					A file that can be read to obtain the possible
>  					values of the <attr>. Values are separated using
>  					semi-colon (``;``).
>  
>  		"integer"-type specific properties:
>  
> -		min_value:	A file that can be read to obtain the lower
> +		min_value:
> +				A file that can be read to obtain the lower
>  				bound value of the <attr>
>  
> -		max_value:	A file that can be read to obtain the upper
> +		max_value:
> +				A file that can be read to obtain the upper
>  				bound value of the <attr>
>  
> -		scalar_increment:	A file that can be read to obtain the scalar value used for
> +		scalar_increment:
> +					A file that can be read to obtain the scalar value used for
>  					increments of current_value this attribute accepts.
>  
>  		"string"-type specific properties:
>  
> -		max_length:	A file that can be read to obtain the maximum
> +		max_length:
> +				A file that can be read to obtain the maximum
>  				length value of the <attr>
>  
> -		min_length:	A file that can be read to obtain the minimum
> +		min_length:
> +				A file that can be read to obtain the minimum
>  				length value of the <attr>
>  
>  		Dell specific class extensions
> -		--------------------------
> +		------------------------------
>  
>  		On Dell systems the following additional attributes are available:
>  
> -		dell_modifier:	A file that can be read to obtain attribute-level
> +		dell_modifier:
> +				A file that can be read to obtain attribute-level
>  				dependency rule. It says an attribute X will become read-only or
>  				suppressed, if/if-not attribute Y is configured.
>  
> -				modifier rules can be in following format:
> -				[ReadOnlyIf:<attribute>=<value>]
> -				[ReadOnlyIfNot:<attribute>=<value>]
> -				[SuppressIf:<attribute>=<value>]
> -				[SuppressIfNot:<attribute>=<value>]
> +				modifier rules can be in following format::
>  
> -				For example:
> -				AutoOnFri/dell_modifier has value,
> -					[SuppressIfNot:AutoOn=SelectDays]
> +				    [ReadOnlyIf:<attribute>=<value>]
> +				    [ReadOnlyIfNot:<attribute>=<value>]
> +				    [SuppressIf:<attribute>=<value>]
> +				    [SuppressIfNot:<attribute>=<value>]
> +
> +				For example::
> +
> +				    AutoOnFri/dell_modifier has value,
> +					    [SuppressIfNot:AutoOn=SelectDays]
>  
>  				This means AutoOnFri will be suppressed in BIOS setup if AutoOn
>  				attribute is not "SelectDays" and its value will not be effective
> @@ -90,18 +105,22 @@ Description:
>  
>  		Enumeration attributes also support the following:
>  
> -		dell_value_modifier:	A file that can be read to obtain value-level dependency.
> +		dell_value_modifier:
> +					A file that can be read to obtain value-level dependency.
>  					This file is similar to dell_modifier but here,	an
>  					attribute's current value will be forcefully changed based
>  					dependent attributes value.
>  
> -					dell_value_modifier rules can be in following format:
> -					<value>[ForceIf:<attribute>=<value>]
> -					<value>[ForceIfNot:<attribute>=<value>]
> +					dell_value_modifier rules can be in following format::
> +
> +					    <value>[ForceIf:<attribute>=<value>]
> +					    <value>[ForceIfNot:<attribute>=<value>]
> +
> +					For example:
> +
> +					    LegacyOrom/dell_value_modifier has value:
> +						    Disabled[ForceIf:SecureBoot=Enabled]
>  
> -					For example,
> -					LegacyOrom/dell_value_modifier has value:
> -						Disabled[ForceIf:SecureBoot=Enabled]
>  					This means LegacyOrom's current value will be forced to
>  					"Disabled" in BIOS setup if SecureBoot is Enabled and its
>  					value will not be effective through sysfs until this rule is
> @@ -113,12 +132,13 @@ KernelVersion:	5.11
>  Contact:	Divya Bharathi <Divya.Bharathi@Dell.com>,
>  		Mario Limonciello <mario.limonciello@dell.com>,
>  		Prasanth KSR <prasanth.ksr@dell.com>
> -
> +Description:
>  		Devices support various authentication mechanisms which can be exposed
>  		as a separate configuration object.
>  
>  		For example a "BIOS Admin" password and "System" Password can be set,
>  		reset or cleared using these attributes.
> +
>  		- An "Admin" password is used for preventing modification to the BIOS
>  		  settings.
>  		- A "System" password is required to boot a machine.
> @@ -126,39 +146,50 @@ Contact:	Divya Bharathi <Divya.Bharathi@Dell.com>,
>  		Change in any of these two authentication methods will also generate an
>  		uevent KOBJ_CHANGE.
>  
> -		is_enabled:		A file that can be read to obtain a 0/1 flag to see if
> +		is_enabled:
> +					A file that can be read to obtain a 0/1 flag to see if
>  					<attr> authentication is enabled.
>  					This attribute is mandatory.
>  
> -		role:			The type of authentication used.
> +		role:
> +					The type of authentication used.
>  					This attribute is mandatory.
> +
>  					Known types:
> -						bios-admin: Representing BIOS administrator password
> -						power-on: Representing a password required to use
> -							  the system
> +						bios-admin:
> +							Representing BIOS administrator password
> +						power-on:
> +							Representing a password required to use
> +							the system
>  
> -		mechanism:		The means of authentication.  This attribute is mandatory.
> +		mechanism:
> +					The means of authentication.  This attribute is mandatory.
>  					Only supported type currently is "password".
>  
> -		max_password_length:	A file that can be read to obtain the
> +		max_password_length:
> +					A file that can be read to obtain the
>  					maximum length of the Password
>  
> -		min_password_length:	A file that can be read to obtain the
> +		min_password_length:
> +					A file that can be read to obtain the
>  					minimum length of the Password
>  
> -		current_password:	A write only value used for privileged access such as
> +		current_password:
> +					A write only value used for privileged access such as
>  					setting	attributes when a system or admin password is set
>  					or resetting to a new password
>  
>  					This attribute is mandatory when mechanism == "password".
>  
> -		new_password:		A write only value that when used in tandem with
> +		new_password:
> +					A write only value that when used in tandem with
>  					current_password will reset a system or admin password.
>  
>  		Note, password management is session specific. If Admin password is set,
>  		same password must be written into current_password file (required for
>  		password-validation) and must be cleared once the session is over.
> -		For example:
> +		For example::
> +
>  			echo "password" > current_password
>  			echo "disabled" > TouchScreen/current_value
>  			echo "" > current_password
> @@ -180,12 +211,15 @@ Description:
>  		pending BIOS attribute changes. Also, an uevent_KOBJ_CHANGE is
>  		generated when it changes to 1.
>  
> -			0:	All BIOS attributes setting are current
> -			1:	A reboot is necessary to get pending BIOS attribute changes
> -				applied
> +			==	=========================================
> +			0	All BIOS attributes setting are current
> +			1	A reboot is necessary to get pending BIOS
> +			        attribute changes applied
> +			==	=========================================
>  
>  		Note, userspace applications need to follow below steps for efficient
>  		BIOS management,
> +
>  		1.	Check if admin password is set. If yes, follow session method for
>  			password management as briefed under authentication section above.
>  		2.	Before setting any attribute, check if it has any modifiers
> @@ -208,17 +242,17 @@ Description:
>  
>  		Reading from it returns a list of supported options encoded as:
>  
> -			'builtinsafe' (Built in safe configuration profile)
> -			'lastknowngood' (Last known good saved configuration profile)
> -			'factory' (Default factory settings configuration profile)
> -			'custom' (Custom saved configuration profile)
> +			- 'builtinsafe' (Built in safe configuration profile)
> +			- 'lastknowngood' (Last known good saved configuration profile)
> +			- 'factory' (Default factory settings configuration profile)
> +			- 'custom' (Custom saved configuration profile)
>  
>  		The currently selected option is printed in square brackets as
> -		shown below:
> +		shown below::
>  
> -		# echo "factory" > /sys/class/firmware-attributes/*/device/attributes/reset_bios
> -		# cat /sys/class/firmware-attributes/*/device/attributes/reset_bios
> -		# builtinsafe lastknowngood [factory] custom
> +		    # echo "factory" > /sys/class/firmware-attributes/*/device/attributes/reset_bios
> +		    # cat /sys/class/firmware-attributes/*/device/attributes/reset_bios
> +		    # builtinsafe lastknowngood [factory] custom
>  
>  		Note that any changes to this attribute requires a reboot
>  		for changes to take effect.
> 

