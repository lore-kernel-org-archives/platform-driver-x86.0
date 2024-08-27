Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0617176FD3
	for <platform-driver-x86@vger.kernel.org>; Tue, 27 Aug 2024 09:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724749802; cv=none; b=WSUdN8LKoz0CX5QpZOPhrcPoUdgHH6XG6RSfg17PMAGgYSzBqioVK+A4D3UMexXweea3ViiBbI1cXFV0cWcEQ1NIx+h6QtvTqGTbWsN/+ENqwqs62g/8qPKgOu03i+fC27oelowximJu4b0M5NTh9dZqRMdTIq9x2Wvelt1FcPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724749802; c=relaxed/simple;
	bh=AlNxAM7JSlDCpwGL75AV4ix+qSWNPVc/q0q2TIuKoOM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ef8yaz6q6QS/r1PqgjxT5nxug7jCYq9H70VMrzn6XAa4gaH2TTPgUkEfkFo6JN5/V8L1pDBEFseqkzgutVviylBJDIjkrrxcTuCHHAi+4cXFKOeOd/mYQlI+Q2szS15rkj8CIsyxmG/L5BRAS3JaJ3E4LkB3k1kDMXsBybD1hRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MRh7dRB6; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MRh7dRB6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1724749798;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ms46jJfB5uJh4cdKqlH0Ud3Q2tMTteM2Uh2m3C5D2Ww=;
	b=MRh7dRB6TAyVAYWcquVDJIILLcYS8B67wtlRfyLM3r89GLSlvfSpVR7kG1kFTFvGA7rwte
	0/slkT0ZATpoKGS7gFEvCwmYdfTqVifmwaoZAYMxtcOu8ovVZ0qNBJv71gpgVCrgLXhUmJ
	bAbb1Fut+0K0clhw1zBtzipMknvPm90=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-298-Vj5bJcfMPj2C28Clk3iF_A-1; Tue, 27 Aug 2024 05:09:55 -0400
X-MC-Unique: Vj5bJcfMPj2C28Clk3iF_A-1
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-5bed68b5ec6so4173744a12.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 27 Aug 2024 02:09:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724749793; x=1725354593;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ms46jJfB5uJh4cdKqlH0Ud3Q2tMTteM2Uh2m3C5D2Ww=;
        b=Z7Fs3Z5cdmWm4wdttBkXxa+EgzAnpfd91iMGOfS44YWhUafsipXPGEMCGGGBpllGn3
         GLUCa6WYgUJ8+11fNFVB9iyV/9sRbndiT5OGGTFeEjUSmN1/qWy6m9ysV8wrV/pxpeKy
         bIQ0QJ31JwgVMxKeQgJwy4CE4zC2e9i30x/GkmJG8z7+hQUorrY/av7c9UcuI1299mjj
         nPD/2hzgysdmkQZbwhG0CQRhkPpf8Mur5n1PSlCdSObKIjjYpEToWxBUMzXU/SqmQ0TT
         cS9Cl0mT1HHPw0k0CHvdJko1d5nmP6LCJG7LBpJYSCkWOspUj12iMQduq1XMNRK8KqWg
         sB4w==
X-Forwarded-Encrypted: i=1; AJvYcCVQRVxj/6JIFBpnqgGn558GjBK79w9qrmU7++YmqpQdFnr0hbRkMm96+aBV6tTiTuTD4O75Zt43GQ9CX5RcuhA8KiwR@vger.kernel.org
X-Gm-Message-State: AOJu0Yys3cm8F62XqViZ0rIGqAFff/0SuyMR1V0cqT0R/38feN/jSGCu
	ITBmsmJiU70iGx7gUNF4IK6+fcZ5BvwnyJSvpMZ8QKAu9NYwQGoQSD9kuABk2Mmy7DF1hWb11Fq
	iS3UjTW2+h9JJOT4Ncm9/6JdigtZoh1JGSmJzIifuMuDhNJq4UfebXDRUcULTl1goxGpmIP1YCC
	v1QYo=
X-Received: by 2002:a05:6402:51ca:b0:5c0:902c:e191 with SMTP id 4fb4d7f45d1cf-5c0902ce1c9mr7827505a12.9.1724749793192;
        Tue, 27 Aug 2024 02:09:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHwOra81V8c3KY1B779MsRtLcVHvekiVbrw4f2RdlUw7ZlNtoJVcFgjUlFEicTeyMHPdiVXFA==
X-Received: by 2002:a05:6402:51ca:b0:5c0:902c:e191 with SMTP id 4fb4d7f45d1cf-5c0902ce1c9mr7827475a12.9.1724749792621;
        Tue, 27 Aug 2024 02:09:52 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c0bb481933sm761463a12.81.2024.08.27.02.09.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Aug 2024 02:09:52 -0700 (PDT)
Message-ID: <9566460c-4d0f-4ead-9fa1-a265c936c3d9@redhat.com>
Date: Tue, 27 Aug 2024 11:09:51 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [bug report] platform/x86: thinkpad_acpi: Add Thinkpad Edge E531
 fan support
To: Dan Carpenter <dan.carpenter@linaro.org>,
 Matthias Fetzer <kontakt@matthias-fetzer.de>
Cc: ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org
References: <f99e558d-c62a-41eb-93b3-cf00c016d907@stanley.mountain>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <f99e558d-c62a-41eb-93b3-cf00c016d907@stanley.mountain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Dan,

On 8/27/24 10:45 AM, Dan Carpenter wrote:
> Hello Matthias Fetzer,
> 
> Commit 57d0557dfa49 ("platform/x86: thinkpad_acpi: Add Thinkpad Edge
> E531 fan support") from Aug 16, 2024 (linux-next), leads to the
> following Smatch static checker warning:
> 
> 	drivers/platform/x86/thinkpad_acpi.c:8387 fan_set_enable()
> 	error: uninitialized symbol 's'.
> 
> drivers/platform/x86/thinkpad_acpi.c
>     8319 static int fan_set_enable(void)
>     8320 {
>     8321         u8 s;
>     8322         int rc;
>     8323 
>     8324         if (!fan_control_allowed)
>     8325                 return -EPERM;
>     8326 
>     8327         if (mutex_lock_killable(&fan_mutex))
>     8328                 return -ERESTARTSYS;
>     8329 
>     8330         switch (fan_control_access_mode) {
>     8331         case TPACPI_FAN_WR_ACPI_FANS:
>     8332         case TPACPI_FAN_WR_TPEC:
>     8333                 rc = fan_get_status(&s);
>     8334                 if (rc)
>     8335                         break;
>     8336 
>     8337                 /* Don't go out of emergency fan mode */
>     8338                 if (s != 7) {
>     8339                         s &= 0x07;
>     8340                         s |= TP_EC_FAN_AUTO | 4; /* min fan speed 4 */
>     8341                 }
>     8342 
>     8343                 if (!acpi_ec_write(fan_status_offset, s))
>     8344                         rc = -EIO;
>     8345                 else {
>     8346                         tp_features.fan_ctrl_status_undef = 0;
>     8347                         rc = 0;
>     8348                 }
>     8349                 break;
>     8350 
>     8351         case TPACPI_FAN_WR_ACPI_SFAN:
>     8352                 rc = fan_get_status(&s);
>     8353                 if (rc)
>     8354                         break;
>     8355 
>     8356                 s &= 0x07;
>     8357 
>     8358                 /* Set fan to at least level 4 */
>     8359                 s |= 4;
>     8360 
>     8361                 if (!acpi_evalf(sfan_handle, NULL, NULL, "vd", s))
>     8362                         rc = -EIO;
>     8363                 else
>     8364                         rc = 0;
>     8365                 break;
>     8366 
>     8367         case TPACPI_FAN_WR_ACPI_FANW:
>     8368                 if (!acpi_evalf(fanw_handle, NULL, NULL, "vdd", 0x8106, 0x05)) {
>     8369                         rc = -EIO;
>     8370                         break;
>     8371                 }
>     8372                 if (!acpi_evalf(fanw_handle, NULL, NULL, "vdd", 0x8100, 0x00)) {
>     8373                         rc = -EIO;
>     8374                         break;
>     8375                 }
>     8376 
>     8377                 rc = 0;
> 
> s isn't set on this path
> 
>     8378                 break;
>     8379 
>     8380         default:
>     8381                 rc = -ENXIO;
>     8382         }
>     8383 
>     8384         mutex_unlock(&fan_mutex);
>     8385 
>     8386         if (!rc)
> --> 8387                 vdbg_printk(TPACPI_DBG_FAN,
>     8388                         "fan control: set fan control register to 0x%02x\n",
>     8389                         s);
>                                  ^
> Here
> 
>     8390         return rc;
>     8391 }

Thank you for reporting this.

Since this is just a debug print I think it is best to fix this by just
initializing s to 0 when it is declared and then just log 0
in the TPACPI_FAN_WR_ACPI_FANW case.

Anyone got any better suggestions ?

Regards,

Hans


