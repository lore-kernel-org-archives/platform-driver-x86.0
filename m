Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 461EB390218;
	Wed, 26 Aug 2026 08:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787732880; cv=none; b=JzIQLV0axx5B1LaYMi78NVHRNQ5VziVMlx3j6gT5fn+l4vJ26LCHEUShO6+cGMm4oArPTdehwuHXb+jR037fyLbQ5lb/uhfdxpaIdWjy8gQLqqqVz0YMrsB4VuWM9XK0navoeha6nQmW0IXqK2mY+EvwJqRZIM7eK0woiww0U7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787732880; c=relaxed/simple;
	bh=x+zcCb6F//VKq+D5uhef3qUozauFXmbvbS05w+5x4Jw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Vl723QBxda5VmgXpk5ObNCO2QYGTE731Do66UkMy9d+4dYYcyKbW5OThImx1igB0891FYzkNDs83HA78xiHIyhy0YlvszVEVDWCDjuZDhvw2VJ6FDPwPtKE81KrHPYNsBwUDWo6p5bS8xi/BREgPyFz81RTV9ZDoHxnabjMaxGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=LyxYirCS; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="LyxYirCS"
Received: from [10.10.12.8] (business-24-134-105-141.pool2.vodafone-ip.de [24.134.105.141])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPSA id 085002FC0061;
	Wed, 26 Aug 2026 10:27:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1787732872;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=g/7MH1wlE2Je+7fCtbbf421Y8h5zM4YmBFQ4UZa7WPI=;
	b=LyxYirCSaYpVzTWRzGWWB4qNgNjOwx0P/e4gSnNxSYzCdeUlRWOPlJTN/I0l0QuXj/RaLG
	wLvYQ2QMSxJTTUm8wTQsHLUJ436mip3HAZ6Dhwp5n+bK7xxShDjmo7k6hGpnsZPnmU6dtD
	OLFXXKIvkDVbHybUJcETCidK4K2KSRw=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
Message-ID: <c79d33c4-5ff4-4f1c-aa8b-e4d0daeb6647@tuxedocomputers.com>
Date: Wed, 26 Aug 2026 10:27:51 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/6] platform/x86/tuxedo: Set HID report ID on success
To: Aaron Erhardt <aer@tuxedocomputers.com>, hansg@kernel.org,
 ilpo.jarvinen@linux.intel.com
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
References: <20260826081149.235487-1-aer@tuxedocomputers.com>
 <20260826081149.235487-3-aer@tuxedocomputers.com>
Content-Language: en-US
From: Werner Sembach <wse@tuxedocomputers.com>
In-Reply-To: <20260826081149.235487-3-aer@tuxedocomputers.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


Am 26.08.26 um 10:11 schrieb Aaron Erhardt:
> While not strictly necessary due to the synchronous handling of HID
> requests, it is better to set the ID of the HID report before
> returning the buffer. This also better complies with the HID spec and
> avoids problems with userspace tools expecting a report ID.
>
> Signed-off-by: Aaron Erhardt <aer@tuxedocomputers.com>
Reviewed-by: Werner Sembach <wse@tuxedocomputers.com>
> ---
>   drivers/platform/x86/tuxedo/nb04/wmi_ab.c | 26 +++++++++++++++++------
>   1 file changed, 19 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/platform/x86/tuxedo/nb04/wmi_ab.c b/drivers/platform/x86/tuxedo/nb04/wmi_ab.c
> index 72205de72256..11babc7c7767 100644
> --- a/drivers/platform/x86/tuxedo/nb04/wmi_ab.c
> +++ b/drivers/platform/x86/tuxedo/nb04/wmi_ab.c
> @@ -766,6 +766,8 @@ static int handle_lamp_array_control_report(struct hid_device *hdev __always_unu
>   static int tux_ll_raw_request(struct hid_device *hdev, u8 reportnum, u8 *buf,
>   			      size_t len, unsigned char rtype, int reqtype)
>   {
> +	int ret = -EINVAL;
> +
>   	if (rtype != HID_FEATURE_REPORT)
>   		return -EINVAL;
>   
> @@ -775,13 +777,15 @@ static int tux_ll_raw_request(struct hid_device *hdev, u8 reportnum, u8 *buf,
>   		case LAMP_ARRAY_ATTRIBUTES_REPORT_ID:
>   			if (len != sizeof(struct lamp_array_attributes_report_t))
>   				return -EINVAL;
> -			return handle_lamp_array_attributes_report(hdev,
> +			ret = handle_lamp_array_attributes_report(hdev,
>   				(struct lamp_array_attributes_report_t *)buf);
> +			break;
>   		case LAMP_ATTRIBUTES_RESPONSE_REPORT_ID:
>   			if (len != sizeof(struct lamp_attributes_response_report_t))
>   				return -EINVAL;
> -			return handle_lamp_attributes_response_report(hdev,
> +			ret = handle_lamp_attributes_response_report(hdev,
>   				(struct lamp_attributes_response_report_t *)buf);
> +			break;
>   		}
>   		break;
>   	case HID_REQ_SET_REPORT:
> @@ -789,28 +793,36 @@ static int tux_ll_raw_request(struct hid_device *hdev, u8 reportnum, u8 *buf,
>   		case LAMP_ATTRIBUTES_REQUEST_REPORT_ID:
>   			if (len != sizeof(struct lamp_attributes_request_report_t))
>   				return -EINVAL;
> -			return handle_lamp_attributes_request_report(hdev,
> +			ret = handle_lamp_attributes_request_report(hdev,
>   				(struct lamp_attributes_request_report_t *)buf);
> +			break;
>   		case LAMP_MULTI_UPDATE_REPORT_ID:
>   			if (len != sizeof(struct lamp_multi_update_report_t))
>   				return -EINVAL;
> -			return handle_lamp_multi_update_report(hdev,
> +			ret = handle_lamp_multi_update_report(hdev,
>   				(struct lamp_multi_update_report_t *)buf);
> +			break;
>   		case LAMP_RANGE_UPDATE_REPORT_ID:
>   			if (len != sizeof(struct lamp_range_update_report_t))
>   				return -EINVAL;
> -			return handle_lamp_range_update_report(hdev,
> +			ret = handle_lamp_range_update_report(hdev,
>   				(struct lamp_range_update_report_t *)buf);
> +			break;
>   		case LAMP_ARRAY_CONTROL_REPORT_ID:
>   			if (len != sizeof(struct lamp_array_control_report_t))
>   				return -EINVAL;
> -			return handle_lamp_array_control_report(hdev,
> +			ret = handle_lamp_array_control_report(hdev,
>   				(struct lamp_array_control_report_t *)buf);
> +			break;
>   		}
>   		break;
>   	}
>   
> -	return -EINVAL;
> +	/* Set report number on success */
> +	if (ret > 0)
> +		buf[0] = reportnum;
> +
> +	return ret;
>   }
>   
>   static const struct hid_ll_driver tux_ll_driver = {
