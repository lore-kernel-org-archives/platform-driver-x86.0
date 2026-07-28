Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3B7D4772A7
	for <platform-driver-x86@vger.kernel.org>; Tue, 28 Jul 2026 22:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785276104; cv=none; b=G9whMI4D+QNSElLEogPnC5HRJ7tMjYCRYxrMRUMpTxdfQ6A1SjbJM12ie9BauZX+hXvVgj7Tk1FYucvnfkKL0hIDbLWI9Rw+7JiwZw7yZYiCCyBOSDoU2fD+RsHsLzbQh+73MIjLFbSFDyHkRwIvjXom8yfsk8KHDJW6yLxmDgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785276104; c=relaxed/simple;
	bh=0CH4KMcXr9oaeZD6NlFB8ot6AsfL7GrO+pmLK0gGiww=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LJ2gq1nV1zKMw0A3H3ah+n4jyEX0Lp0uNGBOUuC/zT7a00hDWzI9/6CwguHLTnJ10hvT22VfzsTc91Guuq2N6uMV0Z8ASt89vAawFzU8Ab2dmtEHnw2YxaDzpUqhPv6ZONFYUxtHvtiJe8XOgJZylPu5UoqwonpHQgSKZ5/+xko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fXmEs9RV; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fXmEs9RV"
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-92e5c92c389so23639285a.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 28 Jul 2026 15:01:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785276094; x=1785880894; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nDoun7OEr0VFdjpcVSQJxT0IbQ+nFZ9G6YKg1Q7PLrM=;
        b=fXmEs9RV91CLtFbAdYh7UvysjaRhmfATSMR/BBQL4tHd892tp5nALKAHMsgahDh6HP
         KS9IWCyBYN2O1VpfazulCP8fBl7Tzb8O+NccxJdCEHpq2/da00FsKDc9DT+ztrxtBSdC
         1UKMtKFHOs/xzb+dzmobbadd7NLYo+/qKpR8ASd+BjfUPbJF3bxYhfgedy5Egb54IiNu
         ozAtI0+K6XSITpFcr9pM40BlnWIOaNKz9oPH4GUES0r7mbwsc80Q03sKlz7dr2OvtJuB
         LqMfcRjRqv2T1849dDeXQO+2CuK16HzfW3GyuTbR50Lqp48WfkTQ5NPYjWkL67KUOlL/
         +uBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785276094; x=1785880894;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nDoun7OEr0VFdjpcVSQJxT0IbQ+nFZ9G6YKg1Q7PLrM=;
        b=hsr4gCck9eBmeGzqQfNQMg1+tXBfIu87+29XCV8u6sYzS/k2YNb1iiQb/hzg4kxxqx
         fUA0vXk5qbMeAEN1q6eD0+pc6kA21ESvPPlGU1SWlURKp3+dw+tXdxLPfKt1CoDjDC4b
         gFb2U6KG7JKJR6UXuMazIY7iJtcRh5ZSi6Zi+B6DQYMOrvY/NQL8taKpmtgNLCmL59v1
         BZX1CiM66/pspeMR7XLEIWYBY/Xg5df425d8eAsAs/UVOzW9W3k3ZJaXoX/snYYyWxZg
         5ZxZNHx33z0jNN8Mpe+ppxf1NQJviNBedN+FPR5nxqjoE9+27Xq92o4RBqzXnCL69ujF
         kytw==
X-Gm-Message-State: AOJu0YwGmKBEdisPssEOpBfoehFwtp9NgqxkraH8x64AQrmD4aJZZJXN
	R3hRoWnFd8Kofn3CkNe4HrX9g0Tf8nz+SPTSIKgkRIOwLgH2oseAy46i
X-Gm-Gg: AR+sD12a2Ny4EiYK1zC9Yh8dUt9I9LKIIMTuSTGEgHO7VTqhuoOMiVaRJpaiYMgm6QF
	kXzBSHjtM+rj3IxYhyQNLA6R810nKg95havZDsJhkzcTzx9ob1WKP5CbYjTJmf/4o1YbJv2Qh7F
	KrWVNUp8sLnGSC0nJnlaxUloS3bulylgIdxS2Sz15Q5GKOhy6I2v0C4lum/pKXv1jnfCACoxlkZ
	ypvo6BS6FAkrH04hHMFXvfaJg7lYHCAposWfk9Hyc5iP9DwY/z/HoRwRKPpxvmZH0uZem8zPEWg
	9qtdT8Z/Qgaoj6sS+Ks4VS3BrFnCcO9L9un8j0z1RO6VtaCuLrbq6e6DxYunchihTEBEOz1n6mx
	5KpZ9xlpD/+E7fkq1Z0fad/9RRprvnhrz9Jpb66zFCf6waG0ey6I3nKDV+NzJ/KFXYYoMoOO96R
	u3JRuZiF978gelhneuyeGWn72l9hdjGraidU9kPZZjE3WkmyGs2GZXDk1yMnOu2AF+gThT
X-Received: by 2002:a05:620a:2787:b0:915:7e22:6f1f with SMTP id af79cd13be357-933026c884cmr440344985a.22.1785276093731;
        Tue, 28 Jul 2026 15:01:33 -0700 (PDT)
Received: from [192.168.0.78] (pool-100-11-178-145.phlapa.fios.verizon.net. [100.11.178.145])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-933e7361dc2sm28717185a.43.2026.07.28.15.01.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jul 2026 15:01:33 -0700 (PDT)
Message-ID: <cb66c1e4-25c8-46c3-9330-188c9e6665f8@gmail.com>
Date: Tue, 28 Jul 2026 18:01:32 -0400
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 0/2] Lenovo Yoga Book 9 keyboard dock detection
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, hdegoede@redhat.com, W_Armin@gmx.de,
 jikos@kernel.org, linux-input@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>
References: <20260722201659.874469-1-carvsdriver@gmail.com>
 <10e5c25d-7fc8-5db8-e8d3-b76c5d413acd@linux.intel.com>
Content-Language: en-US
From: Dave Carey <carvsdriver@gmail.com>
In-Reply-To: <10e5c25d-7fc8-5db8-e8d3-b76c5d413acd@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Got it.  Thanks again for your patience.

Putting together, hopefully the final version for this patch and 
re-submitting.

Cheers!
-Dave

On 7/24/26 7:42 AM, Ilpo Järvinen wrote:
> On Wed, 22 Jul 2026, Dave Carey wrote:
>
>> Changes in v14 (addressing Ilpo Järvinen's v13 review of patch 2/2):
>>
>>    - Restore #include <linux/compiler_attributes.h> and <linux/spinlock.h>,
>>      which were accidentally absent from v13.
>>    - Restore spinlock_t lock in struct yb9_kbdock_data, spin_lock_init(),
>>      and spin_lock/spin_unlock around input_report_switch + input_sync
>>      in yb9_kbdock_report().
>>    - Restore pointer-out yb9_kbdock_query(d, u32 *bkbd) and removal of
>>      zero-initializer from struct wmi_buffer out.
>>    - Restore int return from yb9_kbdock_sync() and error propagation in
>>      yb9_kbdock_resume() and yb9_kbdock_block_probe().
> Hi,
>
> Unfortunately, this still seems to miss one non-cosmetic change (diff of
> diffs, v12 vs v14):
>
> diff --git a/drivers/platform/x86/lenovo/yb9-kbdock.c b/drivers/platform/x86/lenovo/yb9>
>   new file mode 100644
> -index 0000000..0000000
> +index 0000000..40a2566
>   --- /dev/null
>   +++ b/drivers/platform/x86/lenovo/yb9-kbdock.c
> -@@ -0,0 +1,322 @@
> +@@ -0,0 +1,324 @@
>   +// SPDX-License-Identifier: GPL-2.0-or-later
>   +/*
>   + * Lenovo Yoga Book 9 keyboard-dock detection
> @@ -421,8 +449,10 @@
>   +      /*
>   +       * _WED(0xEB) returns EC.BKBD directly as a 32-bit integer
>   +       * (LENOVO_BTKBD_EVENT WmiDataId(1) uint32 Status).
> -+       * Short-buffer guard is handled by .min_event_size below.
>   +       */
> ++      if (!data || data->length < sizeof(__le32))
> ++              return;
> ++
>   +      u32 bkbd = le32_to_cpu(*(const __le32 *)data->data);
>   +
>   +      blocking_notifier_call_chain(&yb9_kbdock_chain_head, bkbd, NULL);
> @@ -441,7 +471,6 @@
>   +      .id_table       = yb9_kbdock_event_id_table,
>   +      .no_singleton   = true,
>   +      .notify_new     = yb9_kbdock_notify_new,
> -+      .min_event_size = sizeof(__le32),
>   +};
>   +
>   +/* ------------------------------------------------------------------
>
>
>> Changes in v13:
> [...snip...]
>
>> Changes in v10 (addressing Armin Wolf's v9 review of patch 2/2):
> [...snip...]
>
>>    - yb9_kbdock_notify_new(): drop manual length check; use
>>      .min_event_size = sizeof(__le32) in struct wmi_driver instead
>>
>> Patch 1/2 (lenovo-ymc) is unchanged from v9.
>
> ...And there's no need to apologize. :-)
>
>
> I personally keep earlier versions of the patches I've sent myself around
> as files so I can easily do diff-of-diffs against the previous version. It
> has saved me sooo many time from making fool of myself.
>
> I actually normally write the patch version history bullets based on that
> diff so I won't forget anything important from it. Nor hallucinate some
> changes that I thought I'd made but didn't (=> back to the drawing board).
>
>
> If you need the old version you can probably get them from lore archive if
> you don't have them around anymore (but by not placing them cleanly into
> own threads one needs to be careful to get the right ones).
>
