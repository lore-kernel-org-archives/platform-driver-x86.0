Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 780771DED48
	for <platform-driver-x86@vger.kernel.org>; Mon,  2 Dec 2024 21:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733176299; cv=none; b=Zls/ihOzl4lFsDbmW+9m9CcCDycat9oqZHqfgfldoOmQeib7palICT9YpRfuitsGB+nnFSRmu3O98MRKyTFYMoGcbbY/t0aW22X/dvRTXSsZQdrT+f7AJdP4sECK3akrXvHXaj0IersZP7oAoWp71wHLILYGSy5wlreccIoOP9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733176299; c=relaxed/simple;
	bh=UVpQNbT7YPYgoOwMunI7O2Nq12+xxdR3AX52aQyDdWM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TIUGcPGHQ4qYSEfGuPBDEN1Z0GyFjH657Er+iCB4/f4uP7sQffs3l2rR0iw6pzSvp34GqdiXgTE5qPdgempw2FySHm4enobKKShDShDcsBXBE+dJYRQm11PmLD3GxBko3ps/MLLBfN7gl7xfzAiSL5ch68bADo8MU5Wg5EuZVkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=alY5OIR5; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="alY5OIR5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733176296;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=V7YzRx3LqzP+3wck/+uMRx+z8ACwnDIwAPlqE+GDCZE=;
	b=alY5OIR5nEoJTG9gSHYXQBKfrUBKtTXFrJoSkV5kEGsVeqBTVcl+oaLjjSbe1pWAkgQGia
	tjsvEkAGQTF0DWH3O5ZgilUdx0vrc/so0kuYMTJMNZ6KmpQc13oF3pkKSWlmaoRvN6kYH1
	LLdHu24sWpiEndHXXXZpRmgIbnhr8wg=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-185-0Ou6u4JiMGiqVzVsTVX5oQ-1; Mon, 02 Dec 2024 16:48:12 -0500
X-MC-Unique: 0Ou6u4JiMGiqVzVsTVX5oQ-1
X-Mimecast-MFC-AGG-ID: 0Ou6u4JiMGiqVzVsTVX5oQ
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-aa541bd849aso309523866b.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 02 Dec 2024 13:48:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733176091; x=1733780891;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V7YzRx3LqzP+3wck/+uMRx+z8ACwnDIwAPlqE+GDCZE=;
        b=EbtfPXofG3zfwps6pPRbcVAnIlEauUke0TZZOzMPDt8HMp5l9VmKEoeBjwqB+XzF58
         W1qd4zU35XhrAAul8r6MlnpI7v7bbB/tSCwjeOmfrVC724BsOiQ/bquyixnmLG1GFfox
         ecIc0JjSXF2fu7R4UTyttx/1v2uuYZEtSOiYhLC4qnb/OrFWDClC4MweBnssIqkxWWih
         1vfrkjmIBj2qyWvFqFqXt+k7uF4Gl/2S2BYFQmsalmtUC03PvyiGW2AhDQ4RFLHvJSlR
         azTXwMpw0W8Sa7Z0nKZehW7w2tgr5hTbJfsbsMJXDmEPypfpKT9bpLzwbCy5rYCx32Do
         5rsw==
X-Gm-Message-State: AOJu0Yy8jf/8G0tXW9wAftc9VcofZa34wEN5XPXz5JSdKSxBHXqh3xic
	v1sZFfkjUNbLlCeeWZVznLJXWzsmF1qxldTn8+s1SZkJNbn9EYVzuWmgyAbOtcL4i77GonDHwlu
	iWtJyrwn4m7XooYg/aF1a8u62CV+6SfPukFnvwcNVgJMs0fsEHdhpiiIjsAM3DqJC3k5lUKA=
X-Gm-Gg: ASbGncv0ulg3t3uB+Jw8dC3Ybfo5oJT1ey9u9a+GQ1b3gZoH1jKDh3eGBd7HorJ5k8P
	peGUYJm9DRWawVesKBNli8hhZ6PHM+nxB6NEc46Gn7/CFH91HOKJsJKGJy5M6awvKgQSOphQQYW
	49foPRRvzYwQckQMNuzS6iCfGBdUIYbxGgRjG/z6CX1WxkO8Xjw3defBICGqUYiyGbV927L0X/p
	bMfprjD3XlWuFoJhTozgYNI0xjUKsBsuw626j1BHdyMAOqvjFFTZ89vGaf0fMHW2rO5kfAg61w2
	QaLcmVpnGqJ1dHvCuH3RCT7wr9M+E/nEDue71LWMNawrqUHmcXlpENhm1hlQMKHdWuHTYfV6hm/
	kZhNggWTxA/xo2OTwUHuf6AGk
X-Received: by 2002:a17:907:350d:b0:aa5:451c:ce1f with SMTP id a640c23a62f3a-aa5810634c0mr2224407366b.59.1733176091241;
        Mon, 02 Dec 2024 13:48:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHK9dmZSxjTK5pP5IG8CKvi2MIoOCO2f7I2qrKtX4K3Zwxpz0fNVi9DeacGXdWvUtE83kDUDg==
X-Received: by 2002:a17:907:350d:b0:aa5:451c:ce1f with SMTP id a640c23a62f3a-aa5810634c0mr2224405566b.59.1733176090892;
        Mon, 02 Dec 2024 13:48:10 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa5996c1408sm543984166b.15.2024.12.02.13.48.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Dec 2024 13:48:10 -0800 (PST)
Message-ID: <040238ad-6f88-4c4a-814e-2b94b7a43116@redhat.com>
Date: Mon, 2 Dec 2024 22:48:09 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] platform/x86: x86-android-tablets: Add Vexia EDU
 ATLA 10 EC battery driver
To: Andy Shevchenko <andy@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org
References: <20241116121659.57487-1-hdegoede@redhat.com>
 <20241116121659.57487-2-hdegoede@redhat.com>
 <b5b40432-77ed-2466-7d30-ce35a239d0ae@linux.intel.com>
 <Z04ASf0znID9C1FN@smile.fi.intel.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Z04ASf0znID9C1FN@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 2-Dec-24 7:45 PM, Andy Shevchenko wrote:
> On Mon, Dec 02, 2024 at 08:34:01PM +0200, Ilpo Järvinen wrote:
>> On Sat, 16 Nov 2024, Hans de Goede wrote:
> 
> ...
> 
>>> +struct atla10_ec_battery_state {
>>> +	u8 status;			/* Using ACPI Battery spec status bits */
>>> +	u8 capacity;			/* Percent */
>>> +	__le16 charge_now_mAh;
>>> +	__le16 voltage_now_mV;
>>> +	__le16 current_now_mA;
>>> +	__le16 charge_full_mAh;
>>> +	__le16 temp;			/* centi degrees Celsius */
>>> +} __packed;
>>> +
>>> +struct atla10_ec_battery_info {
>>> +	__le16 charge_full_design_mAh;
>>> +	__le16 voltage_now_mV;		/* Should be design voltage, but is not ? */
>>> +	__le16 charge_full_design2_mAh;
>>> +} __packed;
>>
>> Both struct have only naturally aligned members. Why is __packed needed?
> 
> Wouldn't the second one give sizeof() == 8 rather than 6? Sorry, my memory
> about this in C is always flaky.

That might be one way how things could go wrong, yes.

To answer Ilpo's original question: these structures represent
the on wire format, hence also the __le16 use and the __packed
is there to disable any possible compiler shenanigans.

I basically always add __packed to structures representing
hw memory / wire formats just to be sure.

Regards,

Hans



