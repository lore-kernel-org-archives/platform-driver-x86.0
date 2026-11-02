Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793587296;
	b=BEO0DlolTOacA6LR0Jq0l8Uh8pzKlibXkg+zGOxU0Rfk/Yvpk5iV1/M7oNV6F1oeP/53
	 CZykP4DePRxK9rZv32+0MKxUACVwdW5SEKcoTXsCf58vKdm7qEX/68LzeuyylSQrxPT5L
	 BuvVFN9Y3pJHP4UHUMhMbw9YHIxXR8LqM91VhoWzpU3GQgjk0leqNMId74q97Qqxvnmfi
	 v1SpEt/3bCFn+BA5snmuIt/5tjNVnG35Ws6wy6Kgdbj8knAm9Xz4Vmcx8CT6nIQpBHGtt
	 QdA4hIojLJEw/PCHZ5Eu4Yubo79kIn/fwn5OnM8LIyMIsiABXjGgV7UV5QnOp8l/MmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793587296;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=QbhFQokJp/Y955PQiirwQtIB6mysvJutrczdaAmitHw=;
	b=xYMg76hcuYIO+g2SrDp1G4nojs5YpWKoGajk+zFfYX8lOe//ZvOXbEdQB/t6woHVcvd2
	 s+3ouvdz20TWaunfa4WlSTyBZe0Y3YW9HHfyctf9x9tikIBuYHULBQ8Xd/SRAcHJfepko
	 dREUcYEpTlv1hGh1wJGpCEZy4sh2Ts5F8kmfQPGGot7dZaebcIJoJmRq6Vp+uiIY5d4Wk
	 DVSLsnhE+MVIaw6ngp4tgMdSC493J8JOYu+1Sge9RLBom+X2vio4cOEY6MKHmhVlNnD4m
	 mn+boMIFIPp1KbjM8+sJvQ6VfMht/sW69A2yFRhOs1rTAnOVpqLqidZMvygUy7tRDlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="z16Qu/jd";
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAF98606A327
	for <platform-driver-x86@vger.kernel.org>; Mon,  2 Nov 2026 02:41:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BAF98606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=z16Qu/jd
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1ae18eb9b69so1499932c88.0
        for <platform-driver-x86@vger.kernel.org>; Sun, 01 Nov 2026 18:41:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793587295; x=1794192095; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QbhFQokJp/Y955PQiirwQtIB6mysvJutrczdaAmitHw=;
        b=z16Qu/jdVpAEr+XhL2BNwfSCVrMizOZEfLK4aIETePlR80WRw3x/jvMpaXXNQJ5m7C
         IR5suVYw6Bjajb0JAuJioak6P8TTmevmngknrACE3GuW+tClRQ6pG5aHkJX9ChUNSKgt
         WScI+vWMeoIsKjW4xkBL1s8kOetlHS3gnHZWMP6at7At+hJ8MOI+ZkYvSnxD7dWJgtR9
         qjeX0WZKRoBDc1R+UH8ZYp68/aVDrQmZusHyRqECMNYYQUJ0uVH3kN0nh7aKaEbOEkVG
         tljYLKX6ITzc7LfKlERGQLKGw8BGzmwYOofjy4o7hwnP9xbZYvkT6kYyZuCvxl8+a0FN
         8FDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793587295; x=1794192095;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QbhFQokJp/Y955PQiirwQtIB6mysvJutrczdaAmitHw=;
        b=I5Y3jLwsr+wWPI70HwmnOsbIeJVKvusWhdspNnFhdhQr2zJg5WET9xb+yw8OGNeqyH
         impQXL6duPnOtxefBbUzmOi+3gblQDyBFj48Bhc6PA0D4Qn/ReLQITcs1BAq6VC1iW8A
         ol/IQ77+jzD4Da1HFc2jyP4FdMkJGdvZ0a0GTcwBVnQ6BGMQlqTFUv+D9qPMPw4C3e13
         vVORFipELF/FJ1CbEvPqNsVgNQX2+LUNe7hMVPCxskR5k8S/5lrRFu0Kiv+DiRXXFNT5
         FQsiur6ZC2Ht9Fj+Lpef5164DsF/j2c6x/HrqmCv8pYNDRkU319WJFbAJqs/9/dh5VWU
         UpGg==
X-Forwarded-Encrypted: i=1; AKwUvBzbVZmQzvPk8o0n8wXLVMOdrdlLtOzcRIa9MQ8YCMCI5LB6maz/mbBsw1SJIwMPUGbiuzh1ToFHzMlIfK8HllZsmnAd@vger.kernel.org
X-Gm-Message-State: AFq9FYICh18+I5odNm/ibjoaqtUzlaEaq86j7PlSS2b7Pa/5wSTQqfhV
	0zDQ3CBj7YBVMQ0SBsgBJq+Wrk8FKUm/f9rEiu77ivYplrMbA8NI+3XT
X-Gm-Gg: AYBFou0q9phzu95uGCqlbJICCcyZpUllTyCsKyh1oOpouV/NFjMv4XiSn78K0SfRvzR
	tpLVB/umB3pQIML9aV/zyxPx/+D8t+Cn70IJBB4ec1wKpHND7wh+A9SBGErwCoNgpqv9OuOh0GS
	uP3lKM6RDc7RbBAIHp0wjIkPSqxmKCzO0adUtDU3tytWjv77avaVKW1lkchrMYaYRFnQO/sgVg5
	eoVv9al8CMmWtmJFccKVqjqIQ7mSdAdxbsWbnlJ0XTYR1PIGERSXxANDiKrq1++Lk5XoBf9E9Je
	wVch5s27DrCKw/c0uUXbD+BuuW/AOMxcnGt3iFj4LrnMmNkRXJN7j1DXPejnSLGL2e0OwFvNerY
	GZytYKJRu5XPOiiDbWxZIPLZySLXq0oqC+lfWrt+bvtUM/WyPt5vFX+0/uuTfgrlaMKBI8l3hMG
	wZvTwZTt/Cwjz2R7AJMO9Wmc7kpcARL53Qk5TUhaP9O9VufLlTjdN4yjo1zfK6aUO+KD2ErrGPl
	PdynB8YI90/Ls7SSORlHhgtbltdryN+k0hs94BpZHYj9UztFNzeMBS8yxpP6b2viAZ3fEoi7fDa
	X+R6kG1a2KcvNkU0nTh7ZcrWEhQXhqAtBaS08XejS9Wa1Q==
X-Received: by 2002:a05:7022:1602:b0:1a8:4997:65f6 with SMTP id a92af1059eb24-1ac5d88c579mr17549874c88.20.1793587294543;
        Sun, 01 Nov 2026 18:41:34 -0800 (PST)
Received: from [192.168.86.23] ([136.25.189.61])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1854da78sm38514927c88.6.2026.11.01.18.41.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Nov 2026 18:41:34 -0800 (PST)
Message-ID: <d9b0d35b-a8e8-4ffb-b2c4-a659ff7e941c@gmail.com>
Date: Sun, 1 Nov 2026 18:41:33 -0800
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] platform/x86/amd/hsmp: Add
 pwr_current_active_freq_limit_source_raw
To: Erwan Velu <erwanaliasr1@gmail.com>, platform-driver-x86@vger.kernel.org
Cc: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>,
 Carlos Bilbao <carlos.bilbao@kernel.org>, Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 linux-kernel@vger.kernel.org
References: <20261007125908.321186-1-erwanaliasr1@gmail.com>
 <20261007125908.321186-5-erwanaliasr1@gmail.com>
Content-Language: en-US
From: Carlos Bilbao <carlos.bilbao.osdev@gmail.com>
In-Reply-To: <20261007125908.321186-5-erwanaliasr1@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/7/26 05:59, Erwan Velu wrote:

> From: Erwan Velu <e.velu@criteo.com>
>
> pwr_current_active_freq_limit_source reports the active frequency limit
> sources as a list of names, one per line, which metrics exporters have
> to parse and map back to a value.
>
> Add pwr_current_active_freq_limit_source_raw, reporting the same source
> bitmask as a single hexadecimal value. Exporters only need a plain
> integer conversion, and its interpretation can be centralized in the
> monitoring stack, e.g. with Grafana value mappings, instead of being
> decoded on each server.
>
> The bit assignment is defined by the HSMP specification and is stable:
> new limit sources are only appended, existing bits never change meaning.
> A given value therefore has a single interpretation, whatever the
> platform or kernel version it comes from.
>
> Assisted-by: claude-opus-5-5
> Signed-off-by: Erwan Velu <e.velu@criteo.com>


Acked-by: Carlos Bilbao <carlos.bilbao@kernel.org>


> ---
>   Documentation/arch/x86/amd_hsmp.rst   |  4 ++++
>   drivers/platform/x86/amd/hsmp/sysfs.c | 18 ++++++++++++++++++
>   2 files changed, 22 insertions(+)
>
> diff --git a/Documentation/arch/x86/amd_hsmp.rst b/Documentation/arch/x86/amd_hsmp.rst
> index 954e938eea3d..66dbf506db05 100644
> --- a/Documentation/arch/x86/amd_hsmp.rst
> +++ b/Documentation/arch/x86/amd_hsmp.rst
> @@ -109,6 +109,10 @@ Following sysfs files are available at /sys/devices/amd_hsmp/socket%d/.
>     in MHz.
>   * pwr_current_active_freq_limit_source: Source of current active frequency
>     limit.
> +* pwr_current_active_freq_limit_source_raw: Source of current active
> +  frequency limit, as a hexadecimal bitmask. Bits 0 to 7 are, in order:
> +  cHTC-Active, PROCHOT, TDC limit, PPT Limit, OPN Max, Reliability Limit,
> +  APML Agent, HSMP Agent.
>   
>   ACPI device object format
>   =========================
> diff --git a/drivers/platform/x86/amd/hsmp/sysfs.c b/drivers/platform/x86/amd/hsmp/sysfs.c
> index e9e91b640b2a..fa1cf8dc3b6f 100644
> --- a/drivers/platform/x86/amd/hsmp/sysfs.c
> +++ b/drivers/platform/x86/amd/hsmp/sysfs.c
> @@ -274,6 +274,21 @@ static ssize_t hsmp_freq_limit_source_show(struct device *dev, struct device_att
>   	return len;
>   }
>   
> +static ssize_t hsmp_freq_limit_source_raw_show(struct device *dev,
> +					       struct device_attribute *attr, char *buf)
> +{
> +	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
> +	struct hsmp_socket *sock = dev_get_drvdata(dev);
> +	u32 data;
> +	int ret;
> +
> +	ret = hsmp_msg_get_nargs(sock->sock_ind, hattr->msg_id, &data, 1);
> +	if (ret)
> +		return ret;
> +
> +	return sysfs_emit(buf, "0x%04lx\n", FIELD_GET(FREQ_SRC_IND_MASK, data));
> +}
> +
>   static const struct bin_attribute  hsmp_metric_tbl_attr = {
>   	.attr = { .name = HSMP_METRICS_TABLE_NAME, .mode = 0444},
>   	.read = hsmp_metric_tbl_acpi_read,
> @@ -307,6 +322,8 @@ HSMP_DEV_ATTR(pwr_current_active_freq_limit, HSMP_GET_SOCKET_FREQ_LIMIT,
>   	      hsmp_freq_limit_show, 0444);
>   HSMP_DEV_ATTR(pwr_current_active_freq_limit_source, HSMP_GET_SOCKET_FREQ_LIMIT,
>   	      hsmp_freq_limit_source_show, 0444);
> +HSMP_DEV_ATTR(pwr_current_active_freq_limit_source_raw, HSMP_GET_SOCKET_FREQ_LIMIT,
> +	      hsmp_freq_limit_source_raw_show, 0444);
>   
>   static struct attribute *hsmp_dev_attr_list[] = {
>   	&hattr_c0_residency_input.dattr.attr,
> @@ -323,6 +340,7 @@ static struct attribute *hsmp_dev_attr_list[] = {
>   	&hattr_clk_fmin.dattr.attr,
>   	&hattr_pwr_current_active_freq_limit.dattr.attr,
>   	&hattr_pwr_current_active_freq_limit_source.dattr.attr,
> +	&hattr_pwr_current_active_freq_limit_source_raw.dattr.attr,
>   	NULL
>   };
>   
