Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55AB738F91
	for <platform-driver-x86@vger.kernel.org>; Wed, 17 Apr 2024 19:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713382803; cv=none; b=C3SQ7mf18+JGhUMk5CMOqzrDs+wboxznSyk5UPNdSmSmskdbluhaFQHGWnjKrPKiGhRiIoW1aDDXvJJ37SmUgeBpLKYkbApHIZjjFQzAkUme5RQ7rG+5LWuqmIHZ639/ZFFFjFLetccdhbIvHRDSm/622eoTdKz7ZzIYxWHONZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713382803; c=relaxed/simple;
	bh=G83eVykAi/efryWX4uKBrbjPsKiRpPqTMa2UvUGOP9c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s7/r30bfmqBzDUs0h9vqt8UY1Fa+KZ1eOmEmG8ug7o7D33YUhaEHVrrfWSh14Ier1uou7ceKd8gj0+vAzPNPgX7XnZ6ytsjYMjm28LZp3NzAx79mp1Le2SCQuORzuyEfPAdt8BSCOWegEdO7Z/UHBSB842hpMNKQjA5qI6ZLv2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=R4NiMgSy; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="R4NiMgSy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713382799;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nHsW1ltpsGcr7bHagE1y1YeI6tL7m/bl+evkY3i/aDw=;
	b=R4NiMgSyTi4r1OpbM9vQi/AtWyNSkG4pImvkLJ2/QE02LNkxeftDZ8BfJgrAqk8c4Zxs6/
	Dqs6VQ/2+RuzqtVl9RbPn3Rjn2cceGxV8ImExm/aROe9eaPJzqmmdvidogKuwpSHYDRCRA
	/PFlNgU/wOvrcUv7TNb5fRLwfyCaESw=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-648-jfmDzFSyNLSW-vecDAkaqQ-1; Wed, 17 Apr 2024 15:39:57 -0400
X-MC-Unique: jfmDzFSyNLSW-vecDAkaqQ-1
Received: by mail-lf1-f72.google.com with SMTP id 2adb3069b0e04-51895074307so26879e87.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 17 Apr 2024 12:39:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713382796; x=1713987596;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nHsW1ltpsGcr7bHagE1y1YeI6tL7m/bl+evkY3i/aDw=;
        b=UO/ZHlYxjwS6C+3aJYjoGbyQLcEfwv7MMZsOWbmTRTrScx5cVGVLQgqo/jwjBQ3f//
         yPdxQrIAq+/jEA40pM6JxMpNEpnq8RFdUFCRMFlruGjclxlFpUGkVFIBodUTwvQs4xoL
         nBygRkEHkKc72NWsu1JrknfSJlpsuGoUlYiwgQ8JuTeASnMr8OvFfA1NqUDVKhGktW3S
         tAVgA/SJ4Rc4a3bdWliIEctrponreOw1FvPd7li3Q9opEX72iF1qQVo1PI1Vc/KOM6py
         rFju8vmP4l6aCH42GKuhDfuBF8sBLIPOhCltTHIKd7QeuLeNlno/1AOCnGRiEo1sz8U0
         eYtA==
X-Forwarded-Encrypted: i=1; AJvYcCUe+q9YGKlhUCahvr494v01QTgux3j7nzf2NEAtN70k6ty1B+ZWZXfqdjxtEbFjCeKu4bwqhCaN0SGUzK+KQW+DJyZo36tmokUw+jBOIc2ceq7A6A==
X-Gm-Message-State: AOJu0YxPVZNa6QMKVdDQBgnJEf18Y850KHJsg9ksgTRy+7SiSp2b5bdc
	h7bG+0Yo1wGmXGw0VtZq9UpfFBhUcGeAhyjJJ3RyQwKwVMwAtsScOTdp87TJiu8BkdmQaeQGXPw
	gUVlvyqiMaAJCLF5kPaJl/LS0sxnGTINrXrFeDq1dD+g4dkFi+IxDAwXP4gYAjoFHpKfN0rg=
X-Received: by 2002:a05:6512:238f:b0:519:63c1:6f2b with SMTP id c15-20020a056512238f00b0051963c16f2bmr217337lfv.54.1713382796130;
        Wed, 17 Apr 2024 12:39:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEQOr0vOl/amoQkG2c8TZZIA3fB3oHHu4NtMOLSJDUVCY8ogv8Z13fBBq9LV7wYICMDiPchjQ==
X-Received: by 2002:a05:6512:238f:b0:519:63c1:6f2b with SMTP id c15-20020a056512238f00b0051963c16f2bmr217322lfv.54.1713382795766;
        Wed, 17 Apr 2024 12:39:55 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id he38-20020a1709073da600b00a51fa9f6d92sm8372953ejc.38.2024.04.17.12.39.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Apr 2024 12:39:55 -0700 (PDT)
Message-ID: <98082080-0fcf-470f-afa5-76ec2bbffee7@redhat.com>
Date: Wed, 17 Apr 2024 21:39:54 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] platform/x86: thinkpad_acpi: Support for
 trackpoint doubletap
To: Mark Pearson <mpearson-lenovo@squebb.ca>
Cc: ilpo.jarvinen@linux.intel.com, hmh@hmh.eng.br,
 ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org,
 linux-kernel@vger.kernel.org, njoshi1@lenovo.com, vsankar@lenovo.com,
 peter.hutterer@redhat.com, Vishnu Sankar <vishnuocv@gmail.com>
References: <mpearson-lenovo@squebb.ca>
 <20240417173124.9953-1-mpearson-lenovo@squebb.ca>
 <20240417173124.9953-2-mpearson-lenovo@squebb.ca>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240417173124.9953-2-mpearson-lenovo@squebb.ca>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Mark,

Thank you for the new version of this series, overall this looks good,
one small remark below.

On 4/17/24 7:31 PM, Mark Pearson wrote:
> Lenovo trackpoints are adding the ability to generate a doubletap event.
> This handles the doubletap event and sends the KEY_PROG1 event to
> userspace.
> 
> Signed-off-by: Mark Pearson <mpearson-lenovo@squebb.ca>
> Signed-off-by: Vishnu Sankar <vishnuocv@gmail.com>
> ---
> Changes in v2:
>  - Use KEY_PROG1 instead of KEY_DOUBLETAP as input maintainer doesn't
>    want new un-specific key codes added.
>  - Add doubletap to hotkey scan code table and use existing hotkey
>    functionality.
>  - Tested using evtest, and then gnome settings to configure a custom shortcut
>    to launch an application.
> 
>  drivers/platform/x86/thinkpad_acpi.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
> index 3b48d893280f..6d04d45e8d45 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -232,6 +232,9 @@ enum tpacpi_hkey_event_t {
>  
>  	/* Misc */
>  	TP_HKEY_EV_RFKILL_CHANGED	= 0x7000, /* rfkill switch changed */
> +
> +	/* Misc2 */
> +	TP_HKEY_EV_TRACK_DOUBLETAP      = 0x8036, /* trackpoint doubletap */
>  };
>  
>  /****************************************************************************
> @@ -1786,6 +1789,7 @@ enum {	/* hot key scan codes (derived from ACPI DSDT) */
>  	TP_ACPI_HOTKEYSCAN_NOTIFICATION_CENTER,
>  	TP_ACPI_HOTKEYSCAN_PICKUP_PHONE,
>  	TP_ACPI_HOTKEYSCAN_HANGUP_PHONE,

I understand why you've done this but I think this needs a comment,
something like:

        /*
         * For TP_HKEY_EV_TRACK_DOUBLETAP, unlike the codes above which map to:
         * (hkey_event - 0x1300) + TP_ACPI_HOTKEYSCAN_EXTENDED_START, this is
         * hardcoded for TP_HKEY_EV_TRACK_DOUBLETAP handling. Therefor this must
         * always be the last entry (after any 0x1300-0x13ff entries).
         */
+	TP_ACPI_HOTKEYSCAN_DOUBLETAP,

I see you got adding the new 0x13xx related hkeyscancodes right in the next
patch in this series but I think such a comment as above will be helpful
for future patches.

If you agree with adding this comment I can add this while merging, no need
to send a new version just for this.

Regards,

Hans





>  	/* Hotkey keymap size */
>  	TPACPI_HOTKEY_MAP_LEN
> @@ -3336,6 +3340,7 @@ static int __init hotkey_init(struct ibm_init_struct *iibm)
>  		KEY_NOTIFICATION_CENTER,	/* Notification Center */
>  		KEY_PICKUP_PHONE,		/* Answer incoming call */
>  		KEY_HANGUP_PHONE,		/* Decline incoming call */
> +		KEY_PROG1,                      /* Trackpoint doubletap */
>  		},
>  	};
>  
> @@ -3996,6 +4001,15 @@ static bool hotkey_notify_6xxx(const u32 hkey,
>  	return true;
>  }
>  
> +static bool hotkey_notify_8xxx(const u32 hkey)
> +{
> +	if (hkey == TP_HKEY_EV_TRACK_DOUBLETAP) {
> +		tpacpi_input_send_key(TP_ACPI_HOTKEYSCAN_DOUBLETAP);
> +		return true;
> +	}
> +	return false;
> +}
> +
>  static void hotkey_notify(struct ibm_struct *ibm, u32 event)
>  {
>  	u32 hkey;
> @@ -4079,6 +4093,10 @@ static void hotkey_notify(struct ibm_struct *ibm, u32 event)
>  				known_ev = true;
>  			}
>  			break;
> +		case 8:
> +			/* 0x8000-0x8FFF: misc2 */
> +			known_ev = hotkey_notify_8xxx(hkey);
> +			break;
>  		}
>  		if (!known_ev) {
>  			pr_notice("unhandled HKEY event 0x%04x\n", hkey);

