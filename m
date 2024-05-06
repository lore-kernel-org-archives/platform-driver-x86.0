Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D5991534E7
	for <platform-driver-x86@vger.kernel.org>; Mon,  6 May 2024 14:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715006488; cv=none; b=YWkQFxgiSkY0dU9t1Sgb0S0sV4yAxdQOt6OzKyZY+qwehJp0xOsxH5PkkL9XhtuGIpJPpdRfyKFDvSifkuMV3w2vKCSW1t8lfLhrVWH4/AzIifvuLOaSOr8AG2POhStqPWxRWTionDVSntv7lFTzb3RkG9xW3GlbFFB+Y37xUJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715006488; c=relaxed/simple;
	bh=ZEykPO6EZ0ODU3IpjPNKwHUWqaYt/w7qsAT8+rplgPA=;
	h=Content-Type:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To; b=UWKQVArODbgxu90LgVUB7xiVAmKcmWOfnPwPhxHGC/lhI7JunhlZZmvZAQFFartX4EWcdptpNVDxf0xv9zio42tr4wnft4mqtoayl9i57Shc+NJB8qU4ty75fwJzSOw5lVqx0NVNf6/JrMNjH3Hd3AG0jXQdx7u1GuGHnFg1xsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=jOU9I/Rj; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="jOU9I/Rj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1715006485;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Sn3AsUogQMn6CkvNqT/jPgA+Wq1wgG0ZJ/d0kXQVdZs=;
	b=jOU9I/RjOj8RjGDVpacOV9Nxh8pGqhh6nypiTptgJDo4Hu3+3LlmUwGUAVb6N3kcU8BSUC
	gFi4dEBa880YGfeSjxwPwPPKrPwcDfE3UmHG9XFNi6iyHHiF6bduDcurUe1XIZO/FSMYxP
	Evfg+avSpyDDEEXVndieueZ9/qgw/qc=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-590-FwPST-ubOFKHlYc6zj0OBA-1; Mon, 06 May 2024 10:41:23 -0400
X-MC-Unique: FwPST-ubOFKHlYc6zj0OBA-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-a5966e85bf6so340584466b.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 06 May 2024 07:41:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715006481; x=1715611281;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Sn3AsUogQMn6CkvNqT/jPgA+Wq1wgG0ZJ/d0kXQVdZs=;
        b=FmnBAirutHIck7/NWKqaNRKxHjlwl/VFul5snpdMHYrTDyBGckWMwQIGIlgbzL898L
         7CG3xxhE7vgWIIUbMVYUULp6+pL/7CpE0/aDXUWSrEB3d3YP/tX8uFbS8D8ZQt1wn4Cu
         UwjO42IUQ5guOXQ+nfBQ515spRz7ilw+0qHKTRun3BQdxTamiMAfImKbuPEcI8b42vjS
         Ej8lJtql2pxb+Z2svUNfRBww5N8Eve7eRmUZlzsfWXkgayOPUbr3z5Or4Jto2vGzmDw4
         gEHmre0iptsNwGQLXsdHykWgcJ4RQUqrnPdw46LISci0QaKqVih8mCyQWsSwKUzvK9ia
         YR7w==
X-Forwarded-Encrypted: i=1; AJvYcCV3BmaXk2d2dtqXTUuxIaC69SlM1v+Fq1gjN77V7E/ItQif9aniQVDAgVqmIFXOnNAAmOFtdHcjNhqK1Wcb1lUYk5yB94Xl3KEmP+VeIB5LfwU8gg==
X-Gm-Message-State: AOJu0YzXFXbCzX/xR5IZgEdbhDZ4ESmDVoPc9R/ct2wb/bOsxJSp1kwE
	OI0lg4gL9gL+rKxyXlb/lwEv5Qof3F5I2rbIAzQT0Vf8aPXZnO90NKY2VvX2JLMXncZpGGZ6MYm
	ZLp6SCG/rwVeoroEStZQUief6RjUtkjByVlLYpOxHySOyVYYfdBiuFvnPy9/8FW4IDQ1WsYDrkt
	yFH9kI5w==
X-Received: by 2002:a17:906:af91:b0:a59:9eee:b1cb with SMTP id mj17-20020a170906af9100b00a599eeeb1cbmr5738376ejb.35.1715006481074;
        Mon, 06 May 2024 07:41:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHIwgNqo+fQB5yv012L8nqRg3v13YGGbbufhalN/A671ZlBdrn+O8lkRqLdd+/AGoCyrYsmCQ==
X-Received: by 2002:a17:906:af91:b0:a59:9eee:b1cb with SMTP id mj17-20020a170906af9100b00a599eeeb1cbmr5738368ejb.35.1715006480685;
        Mon, 06 May 2024 07:41:20 -0700 (PDT)
Received: from [10.40.98.157] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id ww1-20020a170907084100b00a59cb8c93f3sm1588733ejb.58.2024.05.06.07.41.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 May 2024 07:41:20 -0700 (PDT)
Content-Type: multipart/mixed; boundary="------------T5dSQ8KyP7OqQv6YtD0DonW6"
Message-ID: <85ac363b-d129-4525-89aa-d4528b8188a7@redhat.com>
Date: Mon, 6 May 2024 16:41:19 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/2] Defer probing of SAM if serdev device is not ready
To: Weifeng Liu <weifeng.liu.z@gmail.com>,
 platform-driver-x86@vger.kernel.org, linux-serial@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>,
 Maximilian Luz <luzmaximilian@gmail.com>
References: <20240505130800.2546640-1-weifeng.liu.z@gmail.com>
Content-Language: en-US
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240505130800.2546640-1-weifeng.liu.z@gmail.com>

This is a multi-part message in MIME format.
--------------T5dSQ8KyP7OqQv6YtD0DonW6
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 5/5/24 3:07 PM, Weifeng Liu wrote:
> v3 changes:
> * better formatting, nothing special
> 
> v2 changes:
> * resolves Andy's comments
> 
> Original letter:
> 
> Greetings,
> 
> This series is intended to remedy a race condition where surface
> aggregator module (SAM) which is a serdev driver could fail to probe if
> the underlying UART port is not ready to open.  In such circumstance,
> invoking serdev_device_open() gets errno -ENXIO, leading to failure in
> probing of SAM.  However, if the probe is retried in a short delay,
> serdev_device_open() would work as expected and everything just goes
> fine.  As a workaround, adding the serial driver (8250_dw) into
> initramfs or building it into the kernel image significantly mitigates
> the likelihood of encountering this race condition, as in this way the
> serial device would be initialized much earlier than probing of SAM.
> 
> However, IMO we should reliably avoid this sort of race condition.  A
> good way is returning -EPROBE_DEFER when serdev_device_open returns
> -ENXIO so that the kernel will be able to retry the probing later.  This
> is what the first patch tries to do.
> 
> Though this solution might be a good enough solution for this specific
> issue, I am wondering why this kind of race condition could ever happen,
> i.e., why a serdes device could be not ready yet at the moment the
> serdev driver gets called and tries to bind it.  And even if this is an
> expected behavior how serdev driver works, I do feel it a little bit
> weird that we need to identify serdev_device_open() returning -ENXIO as
> non-fatal error and thus return -EPROBE_DEFER manually in such case, as
> I don't see this sort of behavior in other serdev driver.  Maximilian
> and Hans suggested discussing the root cause of the race condition here.
> I will be grateful if you could provide some reasoning and insights on
> this.
> 
> Following is the code path when the issue occurs:
> 
> 	ssam_serial_hub_probe()
> 	serdev_device_open()
> 	ctrl->ops->open()	/* this callback being ttyport_open() */
> 	tty->ops->open()	/* this callback being uart_open() */
> 	tty_port_open()
> 	port->ops->activate()	/* this callback being uart_port_activate() */
> 	Find bit UPF_DEAD is set in uport->flags and fail with errno -ENXIO.
> 
> I notice that flag UPF_DEAD would be set in serial_core_register_port()
> during calling serial_core_add_one_port() but don't have much idea
> what's going on under the hood.

Thank you this explanation + Andy's questions about this were quite
useful. I think I have found the root cause of this problem and I have
attached a patch which should fix this.

After dropping your own fix from your local kernel you should be able
to reproduce this 100% of the time by making the surface_aggregator
module builtin (CONFIG_SURFACE_AGGREGATOR=y) while making 8250_dw
a module (CONFIG_SERIAL_8250_DW=m). Although I'm not sure if the uart
will then not simply be initialzed as something generic. You could also
try building both into the kernel and see if the issue reproduces then.

Once you can reproduce this reliably, give the attached patch a try
to fix this please.

Regards,

Hans



> 
> Additionally, add logs to the probe procedure of SAM in the second
> patch, hoping it could help provide context to user when something
> miserable happens.
> 
> Context of this series is available in [1].
> 
> Best regards,
> Weifeng
> 
> Weifeng Liu (2):
>   platform/surface: aggregator: Defer probing when serdev is not ready
>   platform/surface: aggregator: Log critical errors during SAM probing
> 
>  drivers/platform/surface/aggregator/core.c | 53 ++++++++++++++++------
>  1 file changed, 39 insertions(+), 14 deletions(-)
> 
--------------T5dSQ8KyP7OqQv6YtD0DonW6
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-serial-Clear-UPF_DEAD-before-calling-tty_port_regist.patch"
Content-Disposition: attachment;
 filename*0="0001-serial-Clear-UPF_DEAD-before-calling-tty_port_regist.pa";
 filename*1="tch"
Content-Transfer-Encoding: base64

RnJvbSAyNTZlMWI4M2Q0YTIwMTViMTZiMDM2ZjJhYWEwYzNjNmY2YzYzZTRhIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBIYW5zIGRlIEdvZWRlIDxoZGVnb2VkZUByZWRoYXQu
Y29tPgpEYXRlOiBNb24sIDYgTWF5IDIwMjQgMTY6MjA6NDUgKzAyMDAKU3ViamVjdDogW1BB
VENIXSBzZXJpYWw6IENsZWFyIFVQRl9ERUFEIGJlZm9yZSBjYWxsaW5nCiB0dHlfcG9ydF9y
ZWdpc3Rlcl9kZXZpY2VfYXR0cl9zZXJkZXYoKQoKSWYgYSBzZXJkZXZfZGV2aWNlX2RyaXZl
ciBpcyBhbHJlYWR5IGxvYWRlZCBmb3IgYSBzZXJkZXZfdHR5X3BvcnQgd2hlbiBpdApnZXRz
IHJlZ2lzdGVyZWQgYnkgdHR5X3BvcnRfcmVnaXN0ZXJfZGV2aWNlX2F0dHJfc2VyZGV2KCkg
dGhlbiB0aGF0CmRyaXZlcidzIHByb2JlKCkgbWV0aG9kIHdpbGwgYmUgY2FsbGVkIGltbWVk
aWF0ZWx5LgoKVGhlIHNlcmRldl9kZXZpY2VfZHJpdmVyJ3MgcHJvYmUoKSBtZXRob2Qgc2hv
dWxkIHRoZW4gYmUgYWJsZSB0byBjYWxsCnNlcmRldl9kZXZpY2Vfb3BlbigpIHN1Y2Nlc3Nm
dWxseSwgYnV0IGJlY2F1c2UgVVBGX0RFQUQgaXMgc3RpbGwgZGVhZApzZXJkZXZfZGV2aWNl
X29wZW4oKSB3aWxsIGZhaWwgd2l0aCAtRU5YSU8gaW4gdGhpcyBzY2VuYXJpbzoKCiAgc2Vy
ZGV2X2RldmljZV9vcGVuKCkKICBjdHJsLT5vcHMtPm9wZW4oKQkvKiB0aGlzIGNhbGxiYWNr
IGJlaW5nIHR0eXBvcnRfb3BlbigpICovCiAgdHR5LT5vcHMtPm9wZW4oKQkvKiB0aGlzIGNh
bGxiYWNrIGJlaW5nIHVhcnRfb3BlbigpICovCiAgdHR5X3BvcnRfb3BlbigpCiAgcG9ydC0+
b3BzLT5hY3RpdmF0ZSgpCS8qIHRoaXMgY2FsbGJhY2sgYmVpbmcgdWFydF9wb3J0X2FjdGl2
YXRlKCkgKi8KICBGaW5kIGJpdCBVUEZfREVBRCBpcyBzZXQgaW4gdXBvcnQtPmZsYWdzIGFu
ZCBmYWlsIHdpdGggZXJybm8gLUVOWElPLgoKRml4IHRoaXMgYmUgY2xlYXJpbmcgVVBGX0RF
QUQgYmVmb3JlIHR0eV9wb3J0X3JlZ2lzdGVyX2RldmljZV9hdHRyX3NlcmRldigpCm5vdGUg
dGhpcyBvbmx5IG1vdmVzIHVwIHRoZSBVUERfREVBRCBjbGVhcmluZyBhIHNtYWxsIGJpdCwg
YmVmb3JlOgoKICB0dHlfcG9ydF9yZWdpc3Rlcl9kZXZpY2VfYXR0cl9zZXJkZXYoKTsKICBt
dXRleF91bmxvY2soJnR0eV9wb3J0Lm11dGV4KTsKICB1YXJ0X3BvcnQuZmxhZ3MgJj0gflVQ
Rl9ERUFEOwogIG11dGV4X3VubG9jaygmcG9ydF9tdXRleCk7CgphZnRlcjoKCiAgdWFydF9w
b3J0LmZsYWdzICY9IH5VUEZfREVBRDsKICB0dHlfcG9ydF9yZWdpc3Rlcl9kZXZpY2VfYXR0
cl9zZXJkZXYoKTsKICBtdXRleF91bmxvY2soJnR0eV9wb3J0Lm11dGV4KTsKICBtdXRleF91
bmxvY2soJnBvcnRfbXV0ZXgpOwoKUmVwb3J0ZWQtYnk6IFdlaWZlbmcgTGl1IDx3ZWlmZW5n
LmxpdS56QGdtYWlsLmNvbT4KQ2xvc2VzOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9wbGF0
Zm9ybS1kcml2ZXIteDg2LzIwMjQwNTA1MTMwODAwLjI1NDY2NDAtMS13ZWlmZW5nLmxpdS56
QGdtYWlsLmNvbS8KQ2M6IE1heGltaWxpYW4gTHV6IDxsdXptYXhpbWlsaWFuQGdtYWlsLmNv
bT4KQ2M6IEFuZHkgU2hldmNoZW5rbyA8YW5kcml5LnNoZXZjaGVua29AbGludXguaW50ZWwu
Y29tPgpTaWduZWQtb2ZmLWJ5OiBIYW5zIGRlIEdvZWRlIDxoZGVnb2VkZUByZWRoYXQuY29t
PgotLS0KIGRyaXZlcnMvdHR5L3NlcmlhbC9zZXJpYWxfY29yZS5jIHwgNiArKysrLS0KIDEg
ZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0t
Z2l0IGEvZHJpdmVycy90dHkvc2VyaWFsL3NlcmlhbF9jb3JlLmMgYi9kcml2ZXJzL3R0eS9z
ZXJpYWwvc2VyaWFsX2NvcmUuYwppbmRleCBmZjg1ZWJkM2EwMDcuLmQ5NDI0ZmU2NTEzYiAx
MDA2NDQKLS0tIGEvZHJpdmVycy90dHkvc2VyaWFsL3NlcmlhbF9jb3JlLmMKKysrIGIvZHJp
dmVycy90dHkvc2VyaWFsL3NlcmlhbF9jb3JlLmMKQEAgLTMxOTYsNiArMzE5Niw5IEBAIHN0
YXRpYyBpbnQgc2VyaWFsX2NvcmVfYWRkX29uZV9wb3J0KHN0cnVjdCB1YXJ0X2RyaXZlciAq
ZHJ2LCBzdHJ1Y3QgdWFydF9wb3J0ICp1CiAJaWYgKHVwb3J0LT5hdHRyX2dyb3VwKQogCQl1
cG9ydC0+dHR5X2dyb3Vwc1sxXSA9IHVwb3J0LT5hdHRyX2dyb3VwOwogCisJLyogRW5zdXJl
IHNlcmRldiBkcml2ZXJzIGNhbiBjYWxsIHNlcmRldl9kZXZpY2Vfb3BlbigpIHJpZ2h0IGF3
YXkgKi8KKwl1cG9ydC0+ZmxhZ3MgJj0gflVQRl9ERUFEOworCiAJLyoKIAkgKiBSZWdpc3Rl
ciB0aGUgcG9ydCB3aGV0aGVyIGl0J3MgZGV0ZWN0ZWQgb3Igbm90LiAgVGhpcyBhbGxvd3MK
IAkgKiBzZXRzZXJpYWwgdG8gYmUgdXNlZCB0byBhbHRlciB0aGlzIHBvcnQncyBwYXJhbWV0
ZXJzLgpAQCAtMzIwNiw2ICszMjA5LDcgQEAgc3RhdGljIGludCBzZXJpYWxfY29yZV9hZGRf
b25lX3BvcnQoc3RydWN0IHVhcnRfZHJpdmVyICpkcnYsIHN0cnVjdCB1YXJ0X3BvcnQgKnUK
IAlpZiAoIUlTX0VSUih0dHlfZGV2KSkgewogCQlkZXZpY2Vfc2V0X3dha2V1cF9jYXBhYmxl
KHR0eV9kZXYsIDEpOwogCX0gZWxzZSB7CisJCXVwb3J0LT5mbGFncyB8PSBVUEZfREVBRDsK
IAkJZGV2X2Vycih1cG9ydC0+ZGV2LCAiQ2Fubm90IHJlZ2lzdGVyIHR0eSBkZXZpY2Ugb24g
bGluZSAlZFxuIiwKIAkJICAgICAgIHVwb3J0LT5saW5lKTsKIAl9CkBAIC0zNDExLDggKzM0
MTUsNiBAQCBpbnQgc2VyaWFsX2NvcmVfcmVnaXN0ZXJfcG9ydChzdHJ1Y3QgdWFydF9kcml2
ZXIgKmRydiwgc3RydWN0IHVhcnRfcG9ydCAqcG9ydCkKIAlpZiAocmV0KQogCQlnb3RvIGVy
cl91bnJlZ2lzdGVyX3BvcnRfZGV2OwogCi0JcG9ydC0+ZmxhZ3MgJj0gflVQRl9ERUFEOwot
CiAJbXV0ZXhfdW5sb2NrKCZwb3J0X211dGV4KTsKIAogCXJldHVybiAwOwotLSAKMi40NC4w
Cgo=

--------------T5dSQ8KyP7OqQv6YtD0DonW6--

