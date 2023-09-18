Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A09BCD13D2
	for <platform-driver-x86@archiver.kernel.org>; Mon, 18 Sep 2023 16:10:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229909AbjIRQK4 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 18 Sep 2023 12:10:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229930AbjIRQKb (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 18 Sep 2023 12:10:31 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54A304C2B
        for <platform-driver-x86@vger.kernel.org>; Mon, 18 Sep 2023 09:08:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1695053295;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=+XexqkKy76KsBN3O4pH00RjNvdGyfqCYG8Ff3GefwU8=;
        b=X9llXg2VezFBRjaD8FEjEE898731SG0cQqNAdKZA/jfEpqp62WVUUruz9oOlD4yMP0G7qK
        5dYyN4NTYFCmz8Mblt0e5UhOve4W8D3pm8GxRO286Qckh8+FoFqQ06EQtJhndYSbETvJUI
        roxixVZjrjU8Uvf3FSXGlTGncvRC1XA=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-614-CCaF7mMeOZGfzRxnF40Egw-1; Mon, 18 Sep 2023 10:07:56 -0400
X-MC-Unique: CCaF7mMeOZGfzRxnF40Egw-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-9a9f282713fso319060966b.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 18 Sep 2023 07:07:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695046075; x=1695650875;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+XexqkKy76KsBN3O4pH00RjNvdGyfqCYG8Ff3GefwU8=;
        b=m8+CAc/YrsfO6sqUqdGWBxZtiosvqxerpWxXfVSwVAwEoidLOmoiL6/tqcY576BgBv
         QSayN1+agwc5PKFsC5V1B4DwMA+0Ub1jxlTwqJurRD88TQrWySn+UW0ruTErVDN56nXl
         +4r01tb3AoAxmdAu7eMoFAQOa+dvrOcPl7O4+28nt8YMzjfyQHx3Eo7TrGg218iUe9c9
         BgcuuTuGIxLnd9TxlPogpxI1H8ExJZmrWHaTrqty6cowl6K6ZAgB+w9xCbgNDc/T6fES
         YL+VtLm9dFG3X+UiLu5yq9sgdeSTX9A1AdBBG2wGOleEcJopP2s+8woZbrJcg6ncWJu0
         ZHLQ==
X-Gm-Message-State: AOJu0YwDDhqKnNMvFMZtj2alPddbbS7pSfDkAYVpn9EXrxywA0SOLNvF
        /kBhR1l44S6hy6EclDqkQuWdT2+mbvWw1/GOpVmHoedj/J2p3yPCzu6oHjjw3HQEFwbFj9evxyO
        PB46djxDPsPB0APejGdaeXBmdiyqbnt0uUg==
X-Received: by 2002:a17:906:3191:b0:9a1:688f:cf2d with SMTP id 17-20020a170906319100b009a1688fcf2dmr8473113ejy.39.1695046075388;
        Mon, 18 Sep 2023 07:07:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFPCUHdG3qDkvCdnMamajYy3nh/coGNH1S0k3382QwfE11RH0/RkkcuBOOmBLMCbjeL/n7OGA==
X-Received: by 2002:a17:906:3191:b0:9a1:688f:cf2d with SMTP id 17-20020a170906319100b009a1688fcf2dmr8473093ejy.39.1695046075076;
        Mon, 18 Sep 2023 07:07:55 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id qx15-20020a170906fccf00b009a5f1d15644sm6432716ejb.119.2023.09.18.07.07.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Sep 2023 07:07:53 -0700 (PDT)
Message-ID: <878da778-e183-6ef5-61ce-3a3d059f1a1e@redhat.com>
Date:   Mon, 18 Sep 2023 16:07:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2] platform/x86: think-lmi: Add bulk save feature
Content-Language: en-US
To:     Andy Shevchenko <andriy.shevchenko@intel.com>,
        Mark Pearson <mpearson-lenovo@squebb.ca>
Cc:     markgross@kernel.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <mpearson-lenovo@squebb.ca>
 <20230906121328.50437-1-mpearson-lenovo@squebb.ca>
 <ZQhXZkBHviGOEl-x@smile.fi.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <ZQhXZkBHviGOEl-x@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 9/18/23 15:57, Andy Shevchenko wrote:
> On Wed, Sep 06, 2023 at 08:13:14AM -0400, Mark Pearson wrote:
>> On Lenovo platforms there is a limitation in the number of times an
>> attribute can be saved. This is an architectural limitation and it limits
>> the number of attributes that can be modified to 48.
>> A solution for this is instead of the attribute being saved after every
>> modification allow a user to bulk set the attributes and then trigger a
>> final save. This allows unlimited attributes.
>>
>> This patch introduces a save_settings attribute that can be configured to
>> either single or bulk mode by the user.
>> Single mode is the default but customers who want to avoid the 48
>> attribute limit can enable bulk mode.
>>
>> Displaying the save_settings attribute will display the enabled mode.
>>
>> When in bulk mode writing 'save' to the save_settings attribute will
>> trigger a save. Once this has been done a reboot is required before more
>> attributes can be modified.
> 
> ...
> 
>> +Date:		August 2023
>> +KernelVersion:	6.5
> 
> This is obviously incorrect (outdated) information.

Mark can you please submit a follow up patch fixing this.

> 
> ...
> 
>> +static const char * const save_mode_strings[] = {
>> +	[TLMI_SAVE_SINGLE] = "single",
>> +	[TLMI_SAVE_BULK] = "bulk",
>> +	[TLMI_SAVE_SAVE] = "save"
> 
> Missing comma.

Fixing this retro-actively is not really useful, if we
ever need an extra entry we can deal with the churn then.

> 
>> +};
> 
> ...
> 
>> +static ssize_t save_settings_show(struct kobject *kobj, struct kobj_attribute *attr,
>> +				  char *buf)
>> +{
>> +	/* Check that setting is valid */
>> +	if (WARN_ON((tlmi_priv.save_mode < TLMI_SAVE_SINGLE) ||
>> +		    (tlmi_priv.save_mode > TLMI_SAVE_BULK)))
>> +		return -EIO;
>> +	return sprintf(buf, "%s\n", save_mode_strings[tlmi_priv.save_mode]);
> 
> According to the documentation it must be sysfs_emit() if I'm not missing
> anything here.

Yes switching to sysfs_emit() here in the followup patch would be good.

> 
>> +}
> 
> ...
> 
>> +static ssize_t save_settings_store(struct kobject *kobj, struct kobj_attribute *attr,
>> +				   const char *buf, size_t count)
>> +{
>> +	char *auth_str = NULL;
>> +	int ret = 0;
>> +	int cmd;
>> +
>> +	cmd = sysfs_match_string(save_mode_strings, buf);
>> +
>> +	/* Use lock in case multiple WMI operations needed */
>> +	mutex_lock(&tlmi_mutex);
>> +
>> +	switch (cmd) {
>> +	case TLMI_SAVE_SINGLE:
>> +	case TLMI_SAVE_BULK:
>> +		tlmi_priv.save_mode = cmd;
>> +		goto out;
>> +	case TLMI_SAVE_SAVE:
>> +		/* Check if supported*/
>> +		if ((!tlmi_priv.can_set_bios_settings) ||
>> +		    (tlmi_priv.save_mode == TLMI_SAVE_SINGLE)) {
>> +			ret = -EOPNOTSUPP;
>> +			goto out;
>> +		}
>> +		/* Check there is actually something to save */
>> +		if (!tlmi_priv.save_required) {
>> +			ret = -ENOENT;
>> +			goto out;
>> +		}
>> +		/* Check if certificate authentication is enabled and active */
>> +		if (tlmi_priv.certificate_support && tlmi_priv.pwd_admin->cert_installed) {
>> +			if (!tlmi_priv.pwd_admin->signature ||
>> +			    !tlmi_priv.pwd_admin->save_signature) {
>> +				ret = -EINVAL;
>> +				goto out;
>> +			}
>> +			ret = tlmi_simple_call(LENOVO_SAVE_BIOS_SETTING_CERT_GUID,
>> +					       tlmi_priv.pwd_admin->save_signature);
>> +			if (ret)
>> +				goto out;
>> +		} else if (tlmi_priv.opcode_support) {
>> +			if (tlmi_priv.pwd_admin->valid && tlmi_priv.pwd_admin->password[0]) {
>> +				ret = tlmi_opcode_setting("WmiOpcodePasswordAdmin",
>> +							  tlmi_priv.pwd_admin->password);
>> +				if (ret)
>> +					goto out;
>> +			}
>> +			ret = tlmi_save_bios_settings("");
>> +		} else { /* old non-opcode based authentication method (deprecated) */
>> +			if (tlmi_priv.pwd_admin->valid && tlmi_priv.pwd_admin->password[0]) {
>> +				auth_str = kasprintf(GFP_KERNEL, "%s,%s,%s;",
>> +						     tlmi_priv.pwd_admin->password,
>> +						     encoding_options[tlmi_priv.pwd_admin->encoding],
>> +						     tlmi_priv.pwd_admin->kbdlang);
>> +				if (!auth_str) {
>> +					ret = -ENOMEM;
>> +					goto out;
>> +				}
>> +			}
>> +
>> +			if (auth_str)
>> +				ret = tlmi_save_bios_settings(auth_str);
>> +			else
>> +				ret = tlmi_save_bios_settings("");
>> +		}
>> +		tlmi_priv.save_required = false;
>> +		tlmi_priv.reboot_required = true;
>> +
>> +		if (!ret && !tlmi_priv.pending_changes) {
>> +			tlmi_priv.pending_changes = true;
>> +			/* let userland know it may need to check reboot pending again */
>> +			kobject_uevent(&tlmi_priv.class_dev->kobj, KOBJ_CHANGE);
>> +		}
>> +		break;
> 
>> +	default:
>> +		ret = -EINVAL;
>> +	}
> 
> Missing break; and actually no need to do this part under the lock, besides
> that it shadows an error code, that said this should be
> 
> 	cmd = sysfs_match_string(...);
> 	if (cmd < 0)
> 		return cmd;
> 
> 
>> +out:
>> +	mutex_unlock(&tlmi_mutex);
>> +	kfree(auth_str);
>> +	return ret ?: count;
> 
> You can switch the driver to use cleanup.h at some point.
> 
>> +}
> 
> ...
> 
>> +/* There are a limit on the number of WMI operations you can do if you use
>> + * the default implementation of saving on every set. This is due to a
>> + * limitation in EFI variable space used.
>> + * Have a 'bulk save' mode where you can manually trigger the save, and can
>> + * therefore set unlimited variables - for users that need it.
>> + */
> 
> /*
>  * This is wrong multi-line comment style. This one
>  * is used solely in net subsystem.
>  */
> 

Good catch, Mark can you fix this one too please ?

Also I thought that checkpatch.pl used to catch this ?

Regards,

hans



