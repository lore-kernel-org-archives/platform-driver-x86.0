Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A35381F8185
	for <platform-driver-x86@vger.kernel.org>; Mon, 21 Oct 2024 13:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729515898; cv=none; b=H86OZIRrLMgRsTXdHr1IMnAJBmtRvWiH0za7e8FIaUY70XtycdNrUX4U9qnxwLOVJyvaAjZlUpPEBMjqrB2B3CRy81HhzhOH+22izBsSyNlo/PYyBKJ7lp6vyZthw50OHLIlwP/rb6LfFFYk87bDPhKpeCqtnEO7MlUBBi1KbzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729515898; c=relaxed/simple;
	bh=ZXsRzzI65oFPL+bLiMeRuzFe+GIf/sYuOmsoAjRMaoU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JO+VoKszfNbuHjnWkdCtrONfXXQWBtBCBqTRMtbmlCUmyYUV4WqrDpOCu0yY3P/vUSLz9H4VkELGlGFGKdmGy5JFTfYJbnrTJXMdbapI9uALHjzGx/Ucw+HmtAJPbyyFhTfe4XgOpyvaOusWfZwQsONU+1ghJQDQnzO1na9YCwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=O+6HG9IV; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="O+6HG9IV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729515894;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MnoXKlaAADuYo7UIHUrYglfpwoeZ7XCU5QulYnBo9iY=;
	b=O+6HG9IVnZgEn+7/6pqtTWv/WHtFt9vMp8KT7ZiCN7jz/Ux0JpY1fcgXbmYkGV4eqmY0xU
	p0MXlFolpoxV3iH6PmNk9nJCLmo9YEKFYUqgSG5BSk+lBRmHD8H6j24foQXJTqnOlVjNE9
	2oiLHJH0SO/SB2Eswj2CukjQ2RBkbzQ=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-66-i_8Trn9mOJSoCIY_Hv16PQ-1; Mon, 21 Oct 2024 09:04:53 -0400
X-MC-Unique: i_8Trn9mOJSoCIY_Hv16PQ-1
Received: by mail-lf1-f70.google.com with SMTP id 2adb3069b0e04-539e0fa6f3dso3324936e87.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 21 Oct 2024 06:04:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729515891; x=1730120691;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MnoXKlaAADuYo7UIHUrYglfpwoeZ7XCU5QulYnBo9iY=;
        b=LxmIZ40lpxEWZDuAdTlSqgzTHLh/0Hl9LVvIf6qO3IjAWK7Yvbh9ZMhPY7yQKOX1VF
         eKKJ3Z9V4PWmXmRy2rRQbxWAG17UOv2baV758Dy0iMtOxoHA9JVczHcb36HDDEkAqun+
         oLi/pwe3Y3mu5uC5cd44ogwq2X/MAINbwaNqV/oi/oD+JVUKP7Zh4fsVYCnNg/8azdbp
         ydKf9lFEt3+Tmt8WRNuFMFiCTBCAwYU4FdKBjoPAE3aogfLKU/YlFuaouvvDRNWwRKo8
         kaw5CmvgPh/YdKJym3eDNCiZ8I/2/nFobm7OXE20e+u9DTp50KPp+vrOD7UQIJup62bT
         XKzg==
X-Forwarded-Encrypted: i=1; AJvYcCVQbotQVvviCKAZiOJtSt8MVVabmoD8lrDubHOb/YW9BVfHX3tb23RHlbcEe90B8CDHATIztsDANYJQ6KUXz1CJvel1@vger.kernel.org
X-Gm-Message-State: AOJu0YztzyAFXzHSrjpfF2s8GiJxsfGpWcQKwo9+Ei9btKgyd/aM1zXc
	KmyvOKFgIPvHyWuO6E2jZCIXB2MR2TQ7CJ+IJhA8jXODUh2XZmD6HviSO+ekoyZC+tryifoRW7e
	0nzl/F0EeBfSXhuOrGKx7wMxkDkl4OIovDQxsBmmhgxOQevyZFRf3144eXA9B2Q6q6FCwWF4=
X-Received: by 2002:a05:6512:31c3:b0:535:6baa:8c5d with SMTP id 2adb3069b0e04-53a15444970mr7461440e87.20.1729515891545;
        Mon, 21 Oct 2024 06:04:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGL4sQ4qrfDrX36WQMDxjmFjytkGRNimdA+M0d/Uy0JJag0mVaYAC5dva1+mNzQ1SHOAQb0kg==
X-Received: by 2002:a05:6512:31c3:b0:535:6baa:8c5d with SMTP id 2adb3069b0e04-53a15444970mr7461413e87.20.1729515891071;
        Mon, 21 Oct 2024 06:04:51 -0700 (PDT)
Received: from [10.40.98.157] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a912d636csm201407966b.36.2024.10.21.06.04.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Oct 2024 06:04:50 -0700 (PDT)
Message-ID: <4b9736fd-82db-4863-a251-80d82b375e1b@redhat.com>
Date: Mon, 21 Oct 2024 15:04:50 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] platform/x86/hp: Avoid spurious wakeup on HP ProOne
 440
To: Kai-Heng Feng <kaihengf@nvidia.com>, ilpo.jarvinen@linux.intel.com,
 gregkh@linuxfoundation.org, jorge.lopez2@hp.com
Cc: acelan.kao@canonical.com, platform-driver-x86@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
References: <20240906053047.459036-1-kai.heng.feng@canonical.com>
 <87d40775-9bd4-4f22-81da-4e670236c15e@redhat.com>
 <f6b62a45-c44f-492f-8f79-96b4fd54555e@nvidia.com>
Content-Language: en-US
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <f6b62a45-c44f-492f-8f79-96b4fd54555e@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Kai-Heng,

On 7-Oct-24 6:22 AM, Kai-Heng Feng wrote:
> Hi Hans,
> 
> On 2024/10/5 10:25 PM, Hans de Goede wrote:
>> Hi Kai-Heng,
>>
>> On 6-Sep-24 7:30 AM, Kai-Heng Feng wrote:
>>> The HP ProOne 440 has a power saving design that when the display is
>>> off, it also cuts the USB touchscreen device's power off.
>>>
>>> This can cause system early wakeup because cutting the power off the
>>> touchscreen device creates a disconnect event and prevent the system
>>> from suspending:
>>> [  445.814574] hub 2-0:1.0: hub_suspend
>>> [  445.814652] usb usb2: bus suspend, wakeup 0
>>> [  445.824629] xhci_hcd 0000:00:14.0: Port change event, 1-11, id 11, portsc: 0x202a0
>>> [  445.824639] xhci_hcd 0000:00:14.0: resume root hub
>>> [  445.824651] xhci_hcd 0000:00:14.0: handle_port_status: starting usb1 port polling.
>>> [  445.844039] xhci_hcd 0000:00:14.0: PM: pci_pm_suspend(): hcd_pci_suspend+0x0/0x20 returns -16
>>> [  445.844058] xhci_hcd 0000:00:14.0: PM: dpm_run_callback(): pci_pm_suspend+0x0/0x1c0 returns -16
>>> [  445.844072] xhci_hcd 0000:00:14.0: PM: failed to suspend async: error -16
>>> [  446.276101] PM: Some devices failed to suspend, or early wake event detected
>>>
>>> So add a quirk to make sure the following is happening:
>>> 1. Let the i915 driver suspend first, to ensure the display is off so
>>>     system also cuts the USB touchscreen's power.
>>> 2. Wait a while to let the USB disconnect event fire and get handled.
>>> 3. Since the disconnect event already happened, the xhci's suspend
>>>     routine won't be interrupted anymore.
>>>
>>> Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
>>
>> I was wondering if there is any progress in trying to come up with
>> a more generic fix at the USB hub level for this as discussed in
>> other emails in this thread ?
> 
> This patch fixes this issue and IMO quite generic:
> https://lore.kernel.org/linux-usb/20240906030548.845115-1-duanchenghao@kylinos.cn/

It looks like during review the patch has changes and now it only applies
to S4 / hibernate.

So I guess we may need something similar for S3 / s2idle suspend ?

Regards,

Hans



