Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85CC714900F
	for <platform-driver-x86@vger.kernel.org>; Fri,  2 Feb 2024 17:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706895002; cv=none; b=WCJRk+bz6RpzVE8oOUfznC7XgY8zTj13aCCjY3WuJfllDH8d+X7V9xOIEePgM6EsZzo/P43BXeFxpSk/ra0sbXIH+CQYLBR93OszHLjdZvOJKpURXCb1iCBUJqOpYTU7hLHZnMWX9eN5hboe1qQrd+VR8u+fI1gY2W8SKGJ3OjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706895002; c=relaxed/simple;
	bh=kO6aAZ0pKgUTlZffrnrlc+wT24FMTAWDS5t51S8QsRw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Uupd3bRjab6XelxFbWGUGBgq3kV91sccM1zn86C3ydHQoBV05FCier8qLvGVh1ceShbpKnsZdKRIjuMbYeH8sw1SDEkLotd/K6b5Lr7w+x1XQLF4durI1zqT5SUEUELtiCyh7dToxlGWhNqBruvFyKJWe1JxZ/FISjDtIrOpZiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=e8P2pZFm; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="e8P2pZFm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706894998;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VQmKdJtNienJwWNmm6v9a0mzgCKgqEXZjhpUCZP6vMg=;
	b=e8P2pZFmfxBDAyrCpbVNmEnS83f0mHlqI/ZGP4cz0G4ouljEf2Sf+diThYtk6jRa4Mb76F
	twv9e43PR9fZ0NMwU56KI9E+Erk73yF8eKOev0CNzhCm4GzyL/trhoEaIUk8hFD4+wyW3f
	SleOme6M22UV+Lc/xE6l+U0P6GjK38M=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-665-cBjEAcfOPmqvrHhnwOV5yg-1; Fri, 02 Feb 2024 12:29:56 -0500
X-MC-Unique: cBjEAcfOPmqvrHhnwOV5yg-1
Received: by mail-lf1-f69.google.com with SMTP id 2adb3069b0e04-5113edb4067so193716e87.0
        for <platform-driver-x86@vger.kernel.org>; Fri, 02 Feb 2024 09:29:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706894995; x=1707499795;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VQmKdJtNienJwWNmm6v9a0mzgCKgqEXZjhpUCZP6vMg=;
        b=OpZG+O5G0Tkl2+p2SpE+00FqcuVxp85qdlggI8ocbqeJ8ZvEjCwUqX6fKNdar6RvzG
         RD7hCmITmOWArfVPa7x6Ri0MCDX7tUxZms1tpl5TsxDlkYVF64h4H3C4kpYrl28XWfOj
         CrgLRw1RWcQUmiPcApZHwHPhNpPnb2domtDkTwn0GR8RTDje7xBK7CIG2A07l87t3GMH
         HNBg2Fyh6H8YZkg67Sc1B1DZ1JomvRTww3wgmZclC0vEukJiwoJlzj+7yaOB3MVuIlUZ
         ZAyEJUUqaF0U+p1U/PPcmA3TlmjV/etI5IWejEsaUhsGzf6mkHwN5UE+h8yrlCCmKRz/
         Ajkg==
X-Gm-Message-State: AOJu0Ywn4Ex3SQ5BfNjR4+U1L0DKG9fl/zgyeCABWKrnV03dbczwKMLn
	ij1FTDAQa59LgxMqv39nXTifcEpRaURyIUO/u1rgyjYtLwVNNJToIVZJ3HYaASAHmn0kKwFO0+c
	i+aMItm9fulNpelgrz2G6940YAf5JEgrS8GA4LgakXmKrn7Ln12mfOHMbcR0pwSR34BRoJwQ=
X-Received: by 2002:a05:6512:3a84:b0:511:2aea:5b3f with SMTP id q4-20020a0565123a8400b005112aea5b3fmr4834438lfu.37.1706894995417;
        Fri, 02 Feb 2024 09:29:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGYbd2IfyUkPZvdVN76TlGAqKG60jZr6iMuCWE+d3Zul7AoBzIwQueHDOiJOLbiR6SnxqUaIA==
X-Received: by 2002:a05:6512:3a84:b0:511:2aea:5b3f with SMTP id q4-20020a0565123a8400b005112aea5b3fmr4834431lfu.37.1706894995079;
        Fri, 02 Feb 2024 09:29:55 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCXub7HTMncq+N4U2zioX9QPPfkBSBuaDAevR+5VsWrke7LH52Zdkt/yIWs63xEQf5apvORyKV0RzgWPUzqcu+YuB/K9q2tebZr6In6+FTTrXkPR5F37VcHYgym0IjoyRJ8R07Ydt38OW7xScgEUwYxEna3jzbUS+UI1uy34ELiv5VccXlX1v1r1zKhl69kATexxUMA0tTQhbFYKT5IIIqfoH4hNA1n2lA==
Received: from [192.168.1.24] ([212.76.254.34])
        by smtp.gmail.com with ESMTPSA id t15-20020a05600c450f00b0040fb01d61a3sm484220wmo.18.2024.02.02.09.29.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Feb 2024 09:29:54 -0800 (PST)
Message-ID: <06e92b87-4d48-4519-b1db-6d7605bf3962@redhat.com>
Date: Fri, 2 Feb 2024 18:29:53 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] platform/x86/amd/hsmp: switch to use
 device_add_groups()
Content-Language: en-US
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: naveenkrishna.chatradhi@amd.com, linux-kernel@vger.kernel.org,
 Carlos Bilbao <carlos.bilbao@amd.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 platform-driver-x86@vger.kernel.org
References: <2024020145-junior-outnumber-3e76@gregkh>
 <07010c54-2e44-463b-9a9b-95697fd30ffd@redhat.com>
 <2024020243-blinks-pantomime-c51e@gregkh>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <2024020243-blinks-pantomime-c51e@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 2/2/24 16:32, Greg Kroah-Hartman wrote:
> On Fri, Feb 02, 2024 at 08:49:39AM +0100, Hans de Goede wrote:
>> Hi Greg,
>>
>> On 2/2/24 03:44, Greg Kroah-Hartman wrote:
>>> The use of devm_*() functions works properly for when the device
>>> structure itself is dynamic, but the hsmp driver is attempting to have a
>>> local, static, struct device and then calls devm_() functions attaching
>>> memory to the device that will never be freed.
>>
>> As I mentioned in my reply to v1, this is not correct.
>>
>> There is a global data struct, but that holds a struct device
>> pointer, not the device struct.
> 
> Ooops, I misread that:
> 	static struct hsmp_plat_device plat_dev;
> was not the actual device struct anymore.
> 
>> The device itself is created with platform_device_alloc() +
>> platform_device_add() from module-init and it is removed
>> on module-exit by calling platform_device_unregister()
> 
> Ok, much better.
> 
>> So AFAICT this should keep using the devm_ variant to properly
>> cleanup the sysfs attributes.
> 
> This devm_ variant is odd, and should never have been created as the
> sysfs core always cleans up the sysfs attributes when a device is
> removed, there is no need for it (i.e. they do the same thing.)
> 
> That's why I want to get rid of it, it's pointless :)
> 
>> But what this really needs is to be converted to using
>> amd_hsmp_driver.driver.dev_groups rather then manually
>> calling devm_device_add_groups() I have already asked
>> Suma Hegde (AMD) to take a look at this.
> 
> The initial issue I saw with this is that these attributes are being
> created dynamically, so using dev_groups can be a bit harder.  The code
> paths here are twisty and not obvious as it seems to want to support
> devices of multiple types in the same codebase at the same time.
> 
> But yes, using dev_groups is ideal, and if that happens, I'm happy.
> It's just that there are now only 2 in-kernel users of
> devm_device_add_groups() and I have a patch series to get rid of the
> other one, and so this would be the last, hence my attention to this.
> 
> Again, moving from devm_device_add_groups() to device_add_groups() is a
> no-op from a functional standpoint, so this should be fine.

Ok, I was not aware that the core automatically cleans up
all the attributes anyways.

In that case this fine with me and I agree with merging this
so that you can entirely remove the  devm_ variant:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans



