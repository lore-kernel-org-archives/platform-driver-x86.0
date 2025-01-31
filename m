Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BD9C1494D9
	for <platform-driver-x86@vger.kernel.org>; Fri, 31 Jan 2025 09:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738315006; cv=none; b=KodmPsvSN+q27u7xzd41492iGhk6xlixCcCDDFywksv61x+L2IvqMWuSNxmAQUF0Ee2UiaFdehjsupOI+qOX16q3bFEsoNxkQfdPFeDZm127Nq3H2E/OvOC3KDCvK0ukh9p7DL/H9+lrAloSXrukeQBrv7WFBYpL3hzT3RqVG54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738315006; c=relaxed/simple;
	bh=mnKltg2FvOx3trf98joMHHqkpfHLXTzfoNycyohl9zA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=igA8RBJb69ppwQZCSBVSOSoyoQZpDD8jIibS4a2YW3SILYhflarHpL5oVmVpLPFahlpd6ukXYzF27La9wY/NOwfS9RGsUiwzkU55WYnTgrY0UMc5EAFFCPl8k2CHB2O28uqGirx2jABF2ErRyOchQiL1aGP+T7bwsODiZq3B4UY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AwuAIXSr; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AwuAIXSr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738315003;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xHNsRiCSRz6xsJifECD+Xt4CtJuoDCzikyI/v1psxhc=;
	b=AwuAIXSrJLDKH3eJS2D0VrzbcQbLJA+WHJThEb/xUIivYlUsV6bfIYPhNqmbiA0v/lnYjo
	lQMw82LYEZGnpUvGF/BmOcvAYv+SJm0tkDDCmmb0DOELYMOYWoUPC2XuAfxKReWCRn6XIw
	VNVR6Toa+paxuNHi9wYadpWYlbzW+qY=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-314-IuxaONtcMWeUjEQtprnMKw-1; Fri, 31 Jan 2025 04:16:41 -0500
X-MC-Unique: IuxaONtcMWeUjEQtprnMKw-1
X-Mimecast-MFC-AGG-ID: IuxaONtcMWeUjEQtprnMKw
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-5d3f01eeef8so1407622a12.0
        for <platform-driver-x86@vger.kernel.org>; Fri, 31 Jan 2025 01:16:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738315001; x=1738919801;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xHNsRiCSRz6xsJifECD+Xt4CtJuoDCzikyI/v1psxhc=;
        b=JyHYeLIHK1n5ZDB06E1JEehoM79gR3EjjSdjSap9lH/kbfDs509f2XizJRCRHZj3pM
         OvcRRuz3yZuJUPakl6AKB978ipcLQeKj48rW2SFRa012RN8uFwOYXUHjVDaK9MCgItpd
         jU5/ScK7PFfpr5gH1ciRonXOYjWY/VkY9bvJESY8Y4t+46+j750cq3SiQgr9IzHwsq8x
         oVs6hq4zCGz1Jkwko4tR2CNpu+eWAABNkOmdH24eNDDXGdJbEkB6d3BbVjmR0xbCmIP8
         Em0akhAYaEO6BOgAna8sWZc4QKll0x04iOamHLymWfTOQYZ53dRRcKLKPDCEb61F7Vz7
         ruZQ==
X-Gm-Message-State: AOJu0Ywmf9g4j3Ba13cy808vOE3pBg5g6jAuZQfwGNmrQYKzYlW8U5ea
	L2eafiUjY1Vxl/637l/QYuR0Jser9UsDvP6XobxgLR+7FM/T7Mi6bQb2Yo3qS+XhrSFkku1U924
	qk1H9slGKUIZ5ARgxYhx7sesvZAn26TV2VJDQHnnucKzhnv7VY+aOikPmuQK0+b2Ooblt4xM=
X-Gm-Gg: ASbGnctkXGZM4I0FRiO1HFkMxACfQ2DaU0hu4ili+RXbcfg4I3LU22E0YJei3WYC/v+
	ZdrXpsOWxfVCBO2dS7sEPOdb4Rgz5E1eXCwUWFnmWwpaJPGhLD7QqO0Dr5elIKYcNCTOE1Igb+D
	qAAx21rVRADuB2PodQ28e3139vOL5uNGgFZQHvXdCidubk8S8MqsrBGKe8d4ppN0pPolel8Xq7E
	dYhBtzoeenkRtaavAIva5QKpxvNdLe30+0HsehjVRtyjiHo+RwWjgVBm11L25M1050oaIPGxMRQ
	FU/3LEQfK6FAE9ygKvtsSwxhMNCYx2kyCH/44y8qfQWsIaudG994h3/6LhAWnPbyvIq9N6RgCac
	K7D5qGZ/iZnBEc+lrVqQoHCNn3sYkHWHhr5ytlRAbU5fKYOLMyBlwrHY=
X-Received: by 2002:a05:6402:3511:b0:5d0:81f5:a398 with SMTP id 4fb4d7f45d1cf-5dc5efa8b65mr22809858a12.1.1738315000558;
        Fri, 31 Jan 2025 01:16:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFf4am8MHjco0rJymrwx+u9poYP5/gS8vD1zPBlgsmwx1x0zfJ62gQ/043Oifv+KOQtlg/1uQ==
X-Received: by 2002:a05:6402:3511:b0:5d0:81f5:a398 with SMTP id 4fb4d7f45d1cf-5dc5efa8b65mr22809790a12.1.1738315000152;
        Fri, 31 Jan 2025 01:16:40 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab6e4a320e0sm262029066b.151.2025.01.31.01.16.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jan 2025 01:16:39 -0800 (PST)
Message-ID: <0d2c594d-0bc9-4a96-a0f8-390a9efbfb3e@redhat.com>
Date: Fri, 31 Jan 2025 10:16:38 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/3] int3472: Support GPIO con_id based on _HID
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
 Daniel Scally <djrscally@gmail.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 laurent.pinchart@ideasonboard.com, hverkuil@xs4all.nl,
 linux-media@vger.kernel.org
References: <20250131073707.1082931-1-sakari.ailus@linux.intel.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20250131073707.1082931-1-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 31-Jan-25 8:37 AM, Sakari Ailus wrote:
> Hi folks,
> 
> One patch turned into a set, the second patch being the original one.
> 
> since v3:
> 
> - Add a patch (first one) to switch to unsigned long type for polarity
>   field and renames it as gpio_flags.
> 
> - Use a polarity_low boolean field for indicating the GPIO polarity. This
>   is turned to gpio_flags in int3472_get_con_id_and_polarity().
> 
> - Put the new polarity_low bool field next to the u8's for better struct
>   packing.
> 
> - Add a patch (last one) to rename "func" as "con_id" which is used
>   throughout the GPIO framework.

Thanks the whole series looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

for the series.

Regards,

Hans


p.s.

Did you see my remarks about rewriting the INT3472 code to have it
do all the power-sequencing itself in the "RFC: How to deal with the INT3472
handshake GPIO found on Intel IPU6 MTL?" thread ?


