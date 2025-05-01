Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DD70223323
	for <platform-driver-x86@vger.kernel.org>; Thu,  1 May 2025 12:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746103080; cv=none; b=mjWHA41jctgpTRhJyr8+4RedQ/L8XMpE8ZHESDtH6RdS9Qhbvde7KiiG9d8TJBDQs4ORj7Jk6jsgXCow6EJEiQc5BZVizDGJa4lXa3R8KxSD0FC3TLCHHdIEVMd/k7jWFe3DLaTjjm6iuCw+ulKUec94d4skLJToCHQ+i9Ay2RE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746103080; c=relaxed/simple;
	bh=Y/35uJ/7r9usnQ8rjw3f/d45dgOy6SMymc3p2aDNcAQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D9htDt4VhaalmVb78lj/htgobc51gYvqORDSxSU4vX3cCacRSmYXpLtrdlpfJwTU4HVleOm3qxjMmvxXu7lvLOKYQO0KDabxLTybPDZWsHtKSYb2A5hX5OdDFr9k4IeuBMaEKT/xDStVMgzqAyoDCeXUGNc2FpAzkt8JF/b8qm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bwgFfiVH; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bwgFfiVH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746103077;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=y3Ks4DT30E1yxp3D2avf9OjDJolabKXfaKyi564PEJk=;
	b=bwgFfiVH6ewQPpY5etEqTp/iyDpfWm5USRnCQwzy1RcNESY7t45zuGHlEN6NZRm3hK6RXr
	go9Mtrv3z0lJB5RRWN3tpcv1Ij4xxitb87/Z2udiLJNadqxw9l/MxUZcl9GGVsIqjnnjmD
	OW4LiL+Fqd7Dqk1wRmdIu2NwnNfVuUA=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-32-kM237o-uNOivBB955Du5mQ-1; Thu, 01 May 2025 08:37:54 -0400
X-MC-Unique: kM237o-uNOivBB955Du5mQ-1
X-Mimecast-MFC-AGG-ID: kM237o-uNOivBB955Du5mQ_1746103072
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-5e623fe6aa2so855352a12.2
        for <platform-driver-x86@vger.kernel.org>; Thu, 01 May 2025 05:37:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746103072; x=1746707872;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y3Ks4DT30E1yxp3D2avf9OjDJolabKXfaKyi564PEJk=;
        b=IkDHzP03aNH7q6aEusu9yf9DPfI+ZPu06h2b9ULG2wjBX2oGjamFca/w6miw6KdGIp
         Nar1kxmhXcW92Suq+vR6yRBXgDCqL4MpfCSlcrPdH/djYOWjy9ElbsPbR0dmmYLO6rnQ
         4kOrTCOgj5RlJY/EyCYsnqUxhOnv5j0NrWYt3t6CbZy0lNKYi3ci4sBBGeNTrOOC1BJY
         T9qtNkDOnz5oNuQJkrms+mMTztrfdXJrG6jfiPfP2GI7InmEvEg48Ai91114btss9L4K
         lLKBxfa+WqytiPSvvaHobCowsenUXOaUrYMzKFIny6k3S55Lq6OJ/oQ1/pSZu4ay20Nk
         a3Pw==
X-Gm-Message-State: AOJu0YyAaPV7CroBh6KdTsLYpCQV3LNlseAWpY8PMhZ3j/7ui6M4iQ1p
	FOhIx5q64lzf48FeWVVjaDdaa6XcJRxQiNiphQVaHwdnoFOVzaokmvLe2edQ/yCnGpG7jsMuRIb
	bGtrzTa6jrngFosE2PHDBr5hoGMCoLTd6EK7my4jsZJ3iOo6Cm3GSsJuupNVaRgtn3UkPRK4=
X-Gm-Gg: ASbGncuTU1Jq65evi7oZQA9yYuOfBfGd8sMJIsqUwrT2CzsLlyuE4+F/k54g3AfBVoF
	mOA8zZiqAU9uWBrDHGS6X4BBlmKiHrGb8lW5T4/BUWgj3r0jCDxm9sS2PF2XXgjlCQKDEKQzOdy
	JdcHY1CDFbnGe0NEtKxhWtbCsK4OsCJ/uTalB+LV4ZN53SHF+s1Vq4hs+qUOuGKEJiS4vBGw+K8
	SaOpIbMbpdIQspqphkMJkRQcp9LSRbp/FQ7PgdOKZdqWmqSN8mGUyXjtmtj4nt719dg2K/oCbic
	KpmJOYMYIHhNtY8HXlmafHSYohB95Fe22/43bOZXziWWUomShNFijcg3iOYRtjT06aL3jEL+vjD
	iJFqjaR+TgbJJHaUWcmSJD4JZRZkvUUIWSmWFsQgsNNAZGtaeNuOvD14cAkslKQ==
X-Received: by 2002:a05:6402:5cb:b0:5f6:d1f8:98c9 with SMTP id 4fb4d7f45d1cf-5f91391d709mr2135604a12.33.1746103072078;
        Thu, 01 May 2025 05:37:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF8B9p+CQZD4zy7SWY7Kb6u5DMFr7hw8r+TZRfri5zwbYxrrNNB6IGCfGSQNW7BsObMVmSqFA==
X-Received: by 2002:a05:6402:5cb:b0:5f6:d1f8:98c9 with SMTP id 4fb4d7f45d1cf-5f91391d709mr2135585a12.33.1746103071609;
        Thu, 01 May 2025 05:37:51 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f92febd437sm366699a12.54.2025.05.01.05.37.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 May 2025 05:37:50 -0700 (PDT)
Message-ID: <fa2b8e85-1286-478c-857f-5db05ba0c22d@redhat.com>
Date: Thu, 1 May 2025 14:37:50 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] platform/x86: thinkpad-acpi: Add support for new
 hotkey for camera shutter switch
To: Nitin Joshi <nitjoshi@gmail.com>, ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
 ibm-acpi-devel@lists.sourceforge.net, njoshi1@lenovo.com,
 Mark Pearson <mpearson-lenovo@squebb.ca>
References: <20250501123607.14171-1-nitjoshi@gmail.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20250501123607.14171-1-nitjoshi@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 1-May-25 2:36 PM, Nitin Joshi wrote:
> New Lenovo Thinkpad models, e.g. the 'X9-14 Gen 1' and 'X9-15 Gen 1'
> has new shortcut on F9 key i.e to switch camera shutter and it
> send a new 0x131b hkey event when F9 key is pressed.
> 
> This commit adds support for new hkey 0x131b.
> 
> Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
> Signed-off-by: Nitin Joshi <nitjoshi@gmail.com>
> ---
> Changes in v5:
> * Incorporated review comments for consistency.

Thanks, this version looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans




> Changes in v4:
> * Renamed macro from METHOD_ERR to GCES_NO_SHUTTER_DEVICE.
> Changes in v3:
> * Avoid wasteful get_camera_shutter() calls and Minor changes based on review comments to make
>   code more readable.
> Changes in v2:
> * Added ASL method to get camera shutter status and send it to userspace.
> ---
>  drivers/platform/x86/thinkpad_acpi.c | 43 +++++++++++++++++++++++++++-
>  1 file changed, 42 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
> index 5790095c175e..3c75161667cf 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -182,6 +182,7 @@ enum tpacpi_hkey_event_t {
>  						   * directly in the sparse-keymap.
>  						   */
>  	TP_HKEY_EV_AMT_TOGGLE		= 0x131a, /* Toggle AMT on/off */
> +	TP_HKEY_EV_CAMERASHUTTER_TOGGLE = 0x131b, /* Toggle Camera Shutter */
>  	TP_HKEY_EV_DOUBLETAP_TOGGLE	= 0x131c, /* Toggle trackpoint doubletap on/off */
>  	TP_HKEY_EV_PROFILE_TOGGLE	= 0x131f, /* Toggle platform profile in 2024 systems */
>  	TP_HKEY_EV_PROFILE_TOGGLE2	= 0x1401, /* Toggle platform profile in 2025 + systems */
> @@ -2250,6 +2251,25 @@ static void tpacpi_input_send_tabletsw(void)
>  	}
>  }
>  
> +#define GCES_NO_SHUTTER_DEVICE BIT(31)
> +
> +static int get_camera_shutter(void)
> +{
> +	acpi_handle gces_handle;
> +	int output;
> +
> +	if (ACPI_FAILURE(acpi_get_handle(hkey_handle, "GCES", &gces_handle)))
> +		return -ENODEV;
> +
> +	if (!acpi_evalf(gces_handle, &output, NULL, "dd", 0))
> +		return -EIO;
> +
> +	if (output & GCES_NO_SHUTTER_DEVICE)
> +		return -ENODEV;
> +
> +	return output;
> +}
> +
>  static bool tpacpi_input_send_key(const u32 hkey, bool *send_acpi_ev)
>  {
>  	bool known_ev;
> @@ -3303,7 +3323,7 @@ static int __init hotkey_init(struct ibm_init_struct *iibm)
>  	const struct key_entry *keymap;
>  	bool radiosw_state  = false;
>  	bool tabletsw_state = false;
> -	int hkeyv, res, status;
> +	int hkeyv, res, status, camera_shutter_state;
>  
>  	vdbg_printk(TPACPI_DBG_INIT | TPACPI_DBG_HKEY,
>  			"initializing hotkey subdriver\n");
> @@ -3467,6 +3487,12 @@ static int __init hotkey_init(struct ibm_init_struct *iibm)
>  	if (res)
>  		return res;
>  
> +	camera_shutter_state = get_camera_shutter();
> +	if (camera_shutter_state >= 0) {
> +		input_set_capability(tpacpi_inputdev, EV_SW, SW_CAMERA_LENS_COVER);
> +		input_report_switch(tpacpi_inputdev, SW_CAMERA_LENS_COVER, camera_shutter_state);
> +	}
> +
>  	if (tp_features.hotkey_wlsw) {
>  		input_set_capability(tpacpi_inputdev, EV_SW, SW_RFKILL_ALL);
>  		input_report_switch(tpacpi_inputdev,
> @@ -11236,6 +11262,21 @@ static bool tpacpi_driver_event(const unsigned int hkey_event)
>  		else
>  			dytc_control_amt(!dytc_amt_active);
>  
> +		return true;
> +	case TP_HKEY_EV_CAMERASHUTTER_TOGGLE:
> +		int camera_shutter_state;
> +
> +		camera_shutter_state = get_camera_shutter();
> +		if (camera_shutter_state < 0) {
> +			pr_err("Error retrieving camera shutter state after shutter event\n");
> +			return true;
> +		}
> +		mutex_lock(&tpacpi_inputdev_send_mutex);
> +
> +		input_report_switch(tpacpi_inputdev, SW_CAMERA_LENS_COVER, camera_shutter_state);
> +		input_sync(tpacpi_inputdev);
> +
> +		mutex_unlock(&tpacpi_inputdev_send_mutex);
>  		return true;
>  	case TP_HKEY_EV_DOUBLETAP_TOGGLE:
>  		tp_features.trackpoint_doubletap = !tp_features.trackpoint_doubletap;

