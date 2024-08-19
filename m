Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96B321662EA
	for <platform-driver-x86@vger.kernel.org>; Mon, 19 Aug 2024 14:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724078049; cv=none; b=HJArMOkf5zs7WMtBo0zilsuABWfIASaE4F66s28OnJih/5kMIP9LY+iqq37P72DMKwh5iBOCH2MtiOvbro1sYu2d42Po3+NvXlAji98B2hP/THi8jlPd/RW3ELZdmbMpQyB4SnWQw5xzwP5fi0i/Pth3AUCnmJQQICESppdB948=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724078049; c=relaxed/simple;
	bh=J4t3h/dC3sh2t/GXha8UELsvfdMAqBHr/Gnrua1Ejmc=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=enpER1UZY8Flgl6QB+Wz94/9LshgwyCloodHgW0c6VzjjupUrl7a98akCsUy+2kxzYS/58L+0B56eR3/OFciuTWXa3ln2blAlfQBpGuYZ1+c01Yw7K6ad/muTxiAkvpnplYhgWwR95rFb7vbexfizwXsEhR6e2xxIie5AZvt6uI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZyiiDqzi; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZyiiDqzi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1724078046;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XI1wxLhmaHPph0EHltEz1b+0HPnXw9pYN3u2v6zCAB0=;
	b=ZyiiDqzie7F0wquSBuGluXwUA0m3lteNELB0Boo6uL6HILK9jr0zKQuXjMiX7bgB353b9j
	OlBF9OD/AzS/lgvsLdZWKsaRTjzq+Owb6KNO/WORcqBbl9760dkaOXlSwYvl1vLrwHojeg
	U7VL+8jK4rB9qV1xVFUI5mDsd3XKm34=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-418-btAVgyn1OaeopKEYZK8xsw-1; Mon, 19 Aug 2024 10:34:05 -0400
X-MC-Unique: btAVgyn1OaeopKEYZK8xsw-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-a7a8281dba5so394543966b.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 19 Aug 2024 07:34:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724078043; x=1724682843;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XI1wxLhmaHPph0EHltEz1b+0HPnXw9pYN3u2v6zCAB0=;
        b=WBz32Qayh+FLBIKcip+nJ5EWKsrwhQCM1Tjwt0WkUeq/HFp6hmOBhyyBQpXR6MJAGP
         lsyaNgMwBU1uSISQysoNd3C55wRbrYK9JD9aU9poK4eHlc4NMF9abuiQ35IYGoOYEsS1
         R+MOcwGzJTSyJE5g1LhC2VDEiMPVQU/XyADnajlSFNTGNouAJ4oaC/y0EotZrQpVRE1I
         DPyW8UluQqDit49LAE2deA2c2p4ZYXBf3/WZUNHgcFGpg51YqWrxyE70RmGnFMI090M/
         HqwtfvB7nwhX+GxPyLWjcmPUT1+MQyd83wYOUUcKEikIZ/pxxM0oRjikxAnC0zL3wp0v
         UvRQ==
X-Forwarded-Encrypted: i=1; AJvYcCU//SCL1nX48U7tYq4PVgQHpplY7UHlXWRq0TUebILrrAqJWpdWMAZUS7nT4wdBMR5KxRithvwHSEkk7OymlL00qypllV7W6yEcGCgA92y9yCEoGg==
X-Gm-Message-State: AOJu0Yx61Z9/gKITNnU+LcGymh8btrTTNasdroWe7PoVlz2Zg4o5dROO
	kxFSMwAyKQQ3phjCPReXflHLFXMVSdmkmBekNwOIqOYdK/aEJLVX7z3L5joZcMCgshfp9/cIgMJ
	SkdepEyaqy4hLm7pyQnO7htxI2nW2DQOKZBOUTC1ZgQedaqI6P2nVNrRSZK7rW110D1mqN5xt6s
	Ff8dU=
X-Received: by 2002:a17:907:7e92:b0:a7d:34fd:6cd0 with SMTP id a640c23a62f3a-a8392a498a7mr795749066b.66.1724078042807;
        Mon, 19 Aug 2024 07:34:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHhKOiQkV0PWV7tBvHyFsRImuKBEhItJhUHuQavjrNvTRc1gUnRhUkoj+WHUcUcgG7bRgKzsA==
X-Received: by 2002:a17:907:7e92:b0:a7d:34fd:6cd0 with SMTP id a640c23a62f3a-a8392a498a7mr795746066b.66.1724078042190;
        Mon, 19 Aug 2024 07:34:02 -0700 (PDT)
Received: from [10.40.98.157] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8383935a8bsm639967866b.103.2024.08.19.07.33.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Aug 2024 07:34:01 -0700 (PDT)
Message-ID: <de008820-8b75-4a81-ae8c-fb0d3634feaf@redhat.com>
Date: Mon, 19 Aug 2024 16:33:43 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] platform/x86: thinkpad_acpi: Add Thinkpad Edge E531
 fan support
To: Matthias Fetzer <kontakt@matthias-fetzer.de>, hmh@hmh.eng.br,
 ilpo.jarvinen@linux.intel.com, ibm-acpi-devel@lists.sourceforge.net,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <e1fe661c-281d-9d59-be53-968f7a0bc18a@linux.intel.com>
 <20240816141228.134529-1-kontakt@matthias-fetzer.de>
Content-Language: en-US
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240816141228.134529-1-kontakt@matthias-fetzer.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 8/16/24 4:12 PM, Matthias Fetzer wrote:
> Fan control on the E531 is done using the ACPI methods FANG and
> FANW. The correct parameters and register values were found by
> analyzing EC firmware as well as DSDT. This has been tested on
> my Thinkpad Edge E531 (6885CTO, BIOS HEET52WW 1.33).
> 
> Signed-off-by: Matthias Fetzer <kontakt@matthias-fetzer.de>

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
> 
> Changes in v4:
>     - Remove unnecessary variable
> Changes in v3:
>     - Add missing newline
>     - Remove redundant code
> Changes in v2:
>     - Fix typo in EC memory description
>     - Split plausibilty check for better readability
> 
>  drivers/platform/x86/thinkpad_acpi.c | 143 ++++++++++++++++++++++++++-
>  1 file changed, 142 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
> index 397b409064c9..96c58bc59018 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -7751,6 +7751,28 @@ static struct ibm_struct volume_driver_data = {
>   * 	EC 0x2f (HFSP) might be available *for reading*, but do not use
>   * 	it for writing.
>   *
> + * TPACPI_FAN_RD_ACPI_FANG:
> + * 	ACPI FANG method: returns fan control register
> + *
> + *	Takes one parameter which is 0x8100 plus the offset to EC memory
> + *	address 0xf500 and returns the byte at this address.
> + *
> + *	0xf500:
> + *		When the value is less than 9 automatic mode is enabled
> + *	0xf502:
> + *		Contains the current fan speed from 0-100%
> + *	0xf506:
> + *		Bit 7 has to be set in order to enable manual control by
> + *		writing a value >= 9 to 0xf500
> + *
> + * TPACPI_FAN_WR_ACPI_FANW:
> + * 	ACPI FANG method: sets fan control registers
> + *
> + * 	Takes 0x8100 plus the offset to EC memory address 0xf500 and the
> + * 	value to be written there as parameters.
> + *
> + *	see TPACPI_FAN_RD_ACPI_FANG
> + *
>   * TPACPI_FAN_WR_TPEC:
>   * 	ThinkPad EC register 0x2f (HFSP): fan control loop mode
>   * 	Supported on almost all ThinkPads
> @@ -7884,6 +7906,7 @@ enum {					/* Fan control constants */
>  enum fan_status_access_mode {
>  	TPACPI_FAN_NONE = 0,		/* No fan status or control */
>  	TPACPI_FAN_RD_ACPI_GFAN,	/* Use ACPI GFAN */
> +	TPACPI_FAN_RD_ACPI_FANG,	/* Use ACPI FANG */
>  	TPACPI_FAN_RD_TPEC,		/* Use ACPI EC regs 0x2f, 0x84-0x85 */
>  	TPACPI_FAN_RD_TPEC_NS,		/* Use non-standard ACPI EC regs (eg: L13 Yoga gen2 etc.) */
>  };
> @@ -7891,6 +7914,7 @@ enum fan_status_access_mode {
>  enum fan_control_access_mode {
>  	TPACPI_FAN_WR_NONE = 0,		/* No fan control */
>  	TPACPI_FAN_WR_ACPI_SFAN,	/* Use ACPI SFAN */
> +	TPACPI_FAN_WR_ACPI_FANW,	/* Use ACPI FANW */
>  	TPACPI_FAN_WR_TPEC,		/* Use ACPI EC reg 0x2f */
>  	TPACPI_FAN_WR_ACPI_FANS,	/* Use ACPI FANS and EC reg 0x2f */
>  };
> @@ -7924,9 +7948,13 @@ TPACPI_HANDLE(fans, ec, "FANS");	/* X31, X40, X41 */
>  TPACPI_HANDLE(gfan, ec, "GFAN",	/* 570 */
>  	   "\\FSPD",		/* 600e/x, 770e, 770x */
>  	   );			/* all others */
> +TPACPI_HANDLE(fang, ec, "FANG",	/* E531 */
> +	   );			/* all others */
>  TPACPI_HANDLE(sfan, ec, "SFAN",	/* 570 */
>  	   "JFNS",		/* 770x-JL */
>  	   );			/* all others */
> +TPACPI_HANDLE(fanw, ec, "FANW",	/* E531 */
> +	   );			/* all others */
>  
>  /*
>   * Unitialized HFSP quirk: ACPI DSDT and EC fail to initialize the
> @@ -8033,6 +8061,23 @@ static int fan_get_status(u8 *status)
>  
>  		break;
>  	}
> +	case TPACPI_FAN_RD_ACPI_FANG: {
> +		/* E531 */
> +		int mode, speed;
> +
> +		if (unlikely(!acpi_evalf(fang_handle, &mode, NULL, "dd", 0x8100)))
> +			return -EIO;
> +		if (unlikely(!acpi_evalf(fang_handle, &speed, NULL, "dd", 0x8102)))
> +			return -EIO;
> +
> +		if (likely(status)) {
> +			*status = speed * 7 / 100;
> +			if (mode < 9)
> +				*status |= TP_EC_FAN_AUTO;
> +		}
> +
> +		break;
> +	}
>  	case TPACPI_FAN_RD_TPEC:
>  		/* all except 570, 600e/x, 770e, 770x */
>  		if (unlikely(!acpi_ec_read(fan_status_offset, &s)))
> @@ -8147,6 +8192,17 @@ static int fan2_get_speed(unsigned int *speed)
>  		if (speed)
>  			*speed = lo ? FAN_RPM_CAL_CONST / lo : 0;
>  		break;
> +	case TPACPI_FAN_RD_ACPI_FANG: {
> +		/* E531 */
> +		int speed_tmp;
> +
> +		if (unlikely(!acpi_evalf(fang_handle, &speed_tmp, NULL, "dd", 0x8102)))
> +			return -EIO;
> +
> +		if (likely(speed))
> +			*speed =  speed_tmp * 65535 / 100;
> +		break;
> +	}
>  
>  	default:
>  		return -ENXIO;
> @@ -8206,6 +8262,32 @@ static int fan_set_level(int level)
>  			tp_features.fan_ctrl_status_undef = 0;
>  		break;
>  
> +	case TPACPI_FAN_WR_ACPI_FANW:
> +		if (!(level & TP_EC_FAN_AUTO) && (level < 0 || level > 7))
> +			return -EINVAL;
> +		if (level & TP_EC_FAN_FULLSPEED)
> +			return -EINVAL;
> +
> +		if (level & TP_EC_FAN_AUTO) {
> +			if (!acpi_evalf(fanw_handle, NULL, NULL, "vdd", 0x8106, 0x05)) {
> +				return -EIO;
> +			}
> +			if (!acpi_evalf(fanw_handle, NULL, NULL, "vdd", 0x8100, 0x00)) {
> +				return -EIO;
> +			}
> +		} else {
> +			if (!acpi_evalf(fanw_handle, NULL, NULL, "vdd", 0x8106, 0x45)) {
> +				return -EIO;
> +			}
> +			if (!acpi_evalf(fanw_handle, NULL, NULL, "vdd", 0x8100, 0xff)) {
> +				return -EIO;
> +			}
> +			if (!acpi_evalf(fanw_handle, NULL, NULL, "vdd", 0x8102, level * 100 / 7)) {
> +				return -EIO;
> +			}
> +		}
> +		break;
> +
>  	default:
>  		return -ENXIO;
>  	}
> @@ -8284,6 +8366,19 @@ static int fan_set_enable(void)
>  			rc = 0;
>  		break;
>  
> +	case TPACPI_FAN_WR_ACPI_FANW:
> +		if (!acpi_evalf(fanw_handle, NULL, NULL, "vdd", 0x8106, 0x05)) {
> +			rc = -EIO;
> +			break;
> +		}
> +		if (!acpi_evalf(fanw_handle, NULL, NULL, "vdd", 0x8100, 0x00)) {
> +			rc = -EIO;
> +			break;
> +		}
> +
> +		rc = 0;
> +		break;
> +
>  	default:
>  		rc = -ENXIO;
>  	}
> @@ -8326,6 +8421,22 @@ static int fan_set_disable(void)
>  			fan_control_desired_level = 0;
>  		break;
>  
> +	case TPACPI_FAN_WR_ACPI_FANW:
> +		if (!acpi_evalf(fanw_handle, NULL, NULL, "vdd", 0x8106, 0x45)) {
> +			rc = -EIO;
> +			break;
> +		}
> +		if (!acpi_evalf(fanw_handle, NULL, NULL, "vdd", 0x8100, 0xff)) {
> +			rc = -EIO;
> +			break;
> +		}
> +		if (!acpi_evalf(fanw_handle, NULL, NULL, "vdd", 0x8102, 0x00)) {
> +			rc = -EIO;
> +			break;
> +		}
> +		rc = 0;
> +		break;
> +
>  	default:
>  		rc = -ENXIO;
>  	}
> @@ -8359,6 +8470,23 @@ static int fan_set_speed(int speed)
>  			rc = -EINVAL;
>  		break;
>  
> +	case TPACPI_FAN_WR_ACPI_FANW:
> +		if (speed >= 0 && speed <= 65535) {
> +			if (!acpi_evalf(fanw_handle, NULL, NULL, "vdd", 0x8106, 0x45)) {
> +				rc = -EIO;
> +				break;
> +			}
> +			if (!acpi_evalf(fanw_handle, NULL, NULL, "vdd", 0x8100, 0xff)) {
> +				rc = -EIO;
> +				break;
> +			}
> +			if (!acpi_evalf(fanw_handle, NULL, NULL, "vdd",
> +					0x8102, speed * 100 / 65535))
> +				rc = -EIO;
> +		} else
> +			rc = -EINVAL;
> +		break;
> +
>  	default:
>  		rc = -ENXIO;
>  	}
> @@ -8701,6 +8829,10 @@ static int __init fan_init(struct ibm_init_struct *iibm)
>  		TPACPI_ACPIHANDLE_INIT(gfan);
>  		TPACPI_ACPIHANDLE_INIT(sfan);
>  	}
> +	if (tpacpi_is_lenovo()) {
> +		TPACPI_ACPIHANDLE_INIT(fang);
> +		TPACPI_ACPIHANDLE_INIT(fanw);
> +	}
>  
>  	quirks = tpacpi_check_quirks(fan_quirk_table,
>  				     ARRAY_SIZE(fan_quirk_table));
> @@ -8720,6 +8852,9 @@ static int __init fan_init(struct ibm_init_struct *iibm)
>  	if (gfan_handle) {
>  		/* 570, 600e/x, 770e, 770x */
>  		fan_status_access_mode = TPACPI_FAN_RD_ACPI_GFAN;
> +	} else if (fang_handle) {
> +		/* E531 */
> +		fan_status_access_mode = TPACPI_FAN_RD_ACPI_FANG;
>  	} else {
>  		/* all other ThinkPads: note that even old-style
>  		 * ThinkPad ECs supports the fan control register */
> @@ -8766,6 +8901,11 @@ static int __init fan_init(struct ibm_init_struct *iibm)
>  		fan_control_access_mode = TPACPI_FAN_WR_ACPI_SFAN;
>  		fan_control_commands |=
>  		    TPACPI_FAN_CMD_LEVEL | TPACPI_FAN_CMD_ENABLE;
> +	} else if (fanw_handle) {
> +		/* E531 */
> +		fan_control_access_mode = TPACPI_FAN_WR_ACPI_FANW;
> +		fan_control_commands |=
> +		    TPACPI_FAN_CMD_LEVEL | TPACPI_FAN_CMD_SPEED | TPACPI_FAN_CMD_ENABLE;
>  	} else {
>  		if (!gfan_handle) {
>  			/* gfan without sfan means no fan control */
> @@ -8917,6 +9057,7 @@ static int fan_read(struct seq_file *m)
>  
>  	case TPACPI_FAN_RD_TPEC_NS:
>  	case TPACPI_FAN_RD_TPEC:
> +	case TPACPI_FAN_RD_ACPI_FANG:
>  		/* all except 570, 600e/x, 770e, 770x */
>  		rc = fan_get_status_safe(&status);
>  		if (rc)
> @@ -8937,7 +9078,7 @@ static int fan_read(struct seq_file *m)
>  			 * No other levels settings available
>  			 */
>  			seq_printf(m, "level:\t\t%s\n", status & FAN_NS_CTRL ? "unknown" : "auto");
> -		} else {
> +		} else if (fan_status_access_mode == TPACPI_FAN_RD_TPEC) {
>  			if (status & TP_EC_FAN_FULLSPEED)
>  				/* Disengaged mode takes precedence */
>  				seq_printf(m, "level:\t\tdisengaged\n");

