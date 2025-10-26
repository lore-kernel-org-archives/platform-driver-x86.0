Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCE1619D065
	for <platform-driver-x86@vger.kernel.org>; Sun, 26 Oct 2025 17:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761500463; cv=none; b=JKM1Wu5yFKqASK0/2ffKxBB3rPMlYfHZpm2X63eE4lq7vHK4kUEGOP+c586XLSXzL7VUF8tpFN4xmguWSOIzkOwzeDuqVPIUv25R/uNl7KnuyR3CwO4fbR9y3gzZDTTuFSIxRryL4115x9QgnEi6cy3loucia2pr1MbgvOpUvkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761500463; c=relaxed/simple;
	bh=2DsFfP3g6K3ZVWxIvcUiybcQRZmm79uX6Btw1jSOQ5U=;
	h=Content-Type:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To; b=spHAekTcueZrzCxKYt+IrhGfQKrmxbqXGng8w463XiGITnziBhbjD2z7ei7Et9fyEAk/2ehYSNw40sRsjyaS3PGHPgb/14WOHg3guOH8AwMHwCUfKRQGHfbiFoUuX59A7LdiQegHB9UqkK7dvvsisxeuk81AduoYwa8zFkEj5hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LJPbSSg7; arc=none smtp.client-ip=209.85.210.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LJPbSSg7"
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-7c3e2221217so1839097a34.3
        for <platform-driver-x86@vger.kernel.org>; Sun, 26 Oct 2025 10:41:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761500461; x=1762105261; darn=vger.kernel.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=jZbgABfyMeMCiBbMC7tppr3w1kw7O4kd56YB81YS7qc=;
        b=LJPbSSg7+6bh4/JmGSSIcbLe+3kDnToxpBosMoOBOa2doi7XajvXg4G0Hb67B8Cn8q
         OB/SSh0bCBySCWrVRy+DehgkYkZLaNgGfCCgfMHB0QaqlgXAvFqjG3zP6tPxyuk6SOjL
         vk7LHcPsmiTY8LttcKKrkjRJ+/J06M39zeP78tRh34XntqhugWqTEnmIlQ49kKgXFreM
         vqkP8XPe+RtocYQNjdXU14uPkkyOplz7fFAZcwC4hsANZpXWmIZ8rY5cJ0Rii97liFeh
         6B0xY1eVD+4zSILzZufzgpRwZ1xm6b2ntVkoFqutbVta5HG3VhO4mB8vz8G1FfggkBWN
         GZMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761500461; x=1762105261;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jZbgABfyMeMCiBbMC7tppr3w1kw7O4kd56YB81YS7qc=;
        b=QlzJrRo8i2aunbQtNk584kpa2rNRcS+A85//3gxEhiwCUZnMqo9Dt7m6O15Khvtt4m
         TydPIjHkZp5bXR4fS388diBiExbtZqOp/zNor3koLp29dP+HWJMKrbgXAgOLIgZc2YXR
         LjUhyGtmdKSdFPzQL6dWrleHGFAeDHhv3xVr4u5F9P6+T80NrgYnQtaKcBaWYA5Vx0lh
         47oVAojFYitB/DeW8kR0P9Au0a+iDcRDRW3Q46+B8j2A+EnFzBGtY5X4cpRM7o4kVq0c
         h4qVmj8MoyE9b/dPlTzy1XEGJZsvP8vnRbGJJfSx/Zz38KbQp/aTCJnTx2qsH+mk0qgW
         ji2Q==
X-Forwarded-Encrypted: i=1; AJvYcCUkaQzmJYJywkKKrnWMYNCyB722OSO8L26rNF5uqj92XVoAGGoov7J1mVNofg7bqKb1Xxl5QL8Z/lZlIHzRV5DTaVCx@vger.kernel.org
X-Gm-Message-State: AOJu0YxDeA78S2MJtQ+mT87XdlgMSbPwtAHSdBZlNhZj556wrt5XoX/x
	gocpR6YIhLY0qp2LaFy7G0KeVcqiHCyGF3tPXPeEkPMSROK4647rfmFc1S+E/Q==
X-Gm-Gg: ASbGncuDooCsiofyw7QEJjSxtq1V+aVZsFx307k5hF96bS3/m+keHTrc+HCkWjrH67C
	zZQvs3tNXDFJCu2rTC7miIrlA8o4mSBboUwaKNMs/TpJbfBQM89b4Y59Nh9uQ2WABMe7KyRkOwj
	D9nIEt77/cxejEvHgB2tpMI0CMlJORfgquYfPba2A/zRugre4QxkxGRSJRQ83haQm3IYHbZ3nXy
	FcNrZ5+uIFQuQcs1O6VV825GAH4IP2njZQof0Br8Q5fxFgR2BdQhL6dr8FiOI6zrP2qY0KeaSUv
	BgxKOy7sflcD6o8Il0TUZMWRWB+miJhDgt3hPGxYG7sCZhc4+bP5AMNVSX0+ln5rrmcdPrsJphs
	FiDQ3Iu6AgV5Fv2kYrCsc0ImwIt99dyr9F7hbHqHiS/xGXsJoSNb68LqvDL4aommlSt0wqH8ZmQ
	qqhkTbrM89rm1tJ9E+LJFvcpuTkXuWlAiIEDhSsIMTXaGDeAJi
X-Google-Smtp-Source: AGHT+IFwvh2Yn5+HuIXcG0UzfoQQoVhmXVorJJ31EYjINzeoq/bAydE+XwuHs4BGTfcyZjVeyRirqg==
X-Received: by 2002:a05:6808:1795:b0:443:a287:4ef3 with SMTP id 5614622812f47-44bd42bf2ebmr4845291b6e.32.1761500460762;
        Sun, 26 Oct 2025 10:41:00 -0700 (PDT)
Received: from ?IPV6:2603:8080:1400:9f01:c79c:bc42:e802:389b? ([2603:8080:1400:9f01:c79c:bc42:e802:389b])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-654ef28b84fsm1250367eaf.7.2025.10.26.10.40.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Oct 2025 10:41:00 -0700 (PDT)
Content-Type: multipart/mixed; boundary="------------0tayBGuDNFaO500xo9N5Y2hH"
Message-ID: <84d6bd41-64ff-4380-ad87-54cfbb5bc1a0@gmail.com>
Date: Sun, 26 Oct 2025 12:40:58 -0500
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: AMD PMF: CCP PSP fails to reinitialize after hibernation causing
 TEE errors
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 Lars Francke <lars.francke@gmail.com>
Cc: Tom Lendacky <thomas.lendacky@amd.com>, John Allen <john.allen@amd.com>,
 platform-driver-x86@vger.kernel.org, Patil Rajesh <Patil.Reddy@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>
References: <CAD-Ua_gfJnQSo8ucS_7ZwzuhoBRJ14zXP7s8b-zX3ZcxcyWePw@mail.gmail.com>
 <92785bc4-e8e6-40b4-8ca6-43ef32c0b965@amd.com>
 <CAD-Ua_imV_eB3uYAbZV=AWaVMPMM4CpqzmYFDN7AvJs5q1yg_g@mail.gmail.com>
 <099ba5b9-600f-4604-94c4-781d4d91b091@amd.com>
Content-Language: en-US
From: Mario Limonciello <superm1@gmail.com>
Autocrypt: addr=superm1@gmail.com; keydata=
 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
In-Reply-To: <099ba5b9-600f-4604-94c4-781d4d91b091@amd.com>

This is a multi-part message in MIME format.
--------------0tayBGuDNFaO500xo9N5Y2hH
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 10/26/25 11:49 AM, Shyam Sundar S K wrote:
> + Mario
> 
> On 10/26/2025 22:16, Lars Francke wrote:
>> Hi,
>>
>> thank you Mario for the super quick response.
>> It arrived so fast I missed it.
>>
>> On Sun, Oct 26, 2025 at 3:17 PM Shyam Sundar S K
>> <Shyam-sundar.S-k@amd.com> wrote:
>>>> After resuming from hibernation I get this log line once a second:
>>>>    amd-pmf AMDI0105:00: TEE enact cmd failed. err: ffff000e, ret:0
>>>
>>> Can you please share full dmesg log? Perhaps with both ccp and amd_tee
>>> drivers enabled with dynamic debug.
>>
>> I have (with AI help, but reviewed manually) created a shell script to
>> collect the necessary information. I have attached the full dmesg file
>> to this mail but am not sure if that is proper etiquette here?
>>
>> I put up the script & more debug information in a dedicated
>> repository: https://github.com/lfrancke/amd-pmf-hibernate/tree/main
>>
>>>> Right after hibernation and before the first of those errors I get:
>>>>    ccp 0000:c3:00.2: tee: command 0x5 timed out, disabling PSP
>>>>

This comes from tee_wait_cmd_completion().  Looking at the 
suspend/resume handling code from ccp.ko, I notice that we don't 
actually have any special handling for the TEE ring for S4.  Normally 
that ring is initialized at bootup (by sending PSP_CMD_TEE_RING_INIT to 
PSP).

During the S4 resume flow I don't expect that this has happened and is 
needed explicitly in the restore() call.

Can you try this attached patch which inserts that flow to see if it 
helps?

Note mostly to myself: I need to double check flows but I think restore 
also needs a pm_hibernate_is_recovering() check in this case too if this 
works.

>>>> On boot it looks good:
>>>>    ccp 0000:c3:00.2: psp enabled
>>>
>>> Do you see this message after hibernation exit?
>>
>> Yes. On a fresh boot it works without issues but after the first
>> hibernate I get these.
>>
>>
>>>> Commit 11e298f3548a6fe5e6ad78f811abfba15e6ebbc1 from 2024 has
>>>> more or less exactly my error message but it doesn't seem
>>>> to be fixed for this case.
>>>> https://lore.kernel.org/all/20240216064112.962582-2-Shyam-sundar.S-k@amd.com/
>>>
>>> This was a case fixed for S2Idle cases, but I seem to understand that
>>> you are attempting hibernate here, right?
>>
>> Correct. I use hibernate.
>>
>> The issue I'm really trying to debug is a separate one (I'll report
>> separately): Hibernate doesn't reliably turn off the laptop. Image is
>> being written successfully but I have to press the power button for
>> 4s.

Potential theory on root cause is that it's the same regression reported 
here [1].

If so the root cause is [2], and the fix is [3].

Link:
https://lore.kernel.org/linux-pm/a2563b83-e5d7-4d02-a317-54d51e718d32@kernel.org/T/#m19966ea259837e4b02c6d0a55d67acfe15fc64ae 
[1]
Link: https://git.kernel.org/torvalds/c/469d80a3712c6  [2]
Link: 
https://lore.kernel.org/linux-pm/20251026033115.436448-1-superm1@kernel.org/ 
[3]
--------------0tayBGuDNFaO500xo9N5Y2hH
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-crypto-ccp-Add-an-S4-restore-flow.patch"
Content-Disposition: attachment;
 filename="0001-crypto-ccp-Add-an-S4-restore-flow.patch"
Content-Transfer-Encoding: base64

RnJvbSAxYTQ0Yjk2YjRiOTNkNmVjMDA4NTZkZDMzNTMwMmUwYTJkY2NiZDk2IE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiAiTWFyaW8gTGltb25jaWVsbG8gKEFNRCkiIDxzdXBl
cm0xQGtlcm5lbC5vcmc+CkRhdGU6IFN1biwgMjYgT2N0IDIwMjUgMTI6MzQ6NDggLTA1MDAK
U3ViamVjdDogW1BBVENIXSBjcnlwdG86IGNjcCAtIEFkZCBhbiBTNCByZXN0b3JlIGZsb3cK
ClRoZSBzeXN0ZW0gd2lsbCBoYXZlIGxvc3QgcG93ZXIgZHVyaW5nIFM0LiAgVGhlIHJpbmcg
dXNlZCBmb3IgVEVFCmNvbW11bmljYXRpb25zIG5lZWRzIHRvIGJlIGluaXRpYWxpemVkIGJl
Zm9yZSB1c2UuCgpTaWduZWQtb2ZmLWJ5OiBNYXJpbyBMaW1vbmNpZWxsbyAoQU1EKSA8c3Vw
ZXJtMUBrZXJuZWwub3JnPgotLS0KIGRyaXZlcnMvY3J5cHRvL2NjcC9zcC1kZXYuYyAgfCAx
MyArKysrKysrKysrKysrCiBkcml2ZXJzL2NyeXB0by9jY3Avc3AtZGV2LmggIHwgIDEgKwog
ZHJpdmVycy9jcnlwdG8vY2NwL3NwLXBjaS5jICB8IDE2ICsrKysrKysrKysrKysrKysKIGRy
aXZlcnMvY3J5cHRvL2NjcC90ZWUtZGV2LmMgfCAgOCArKysrKysrKwogZHJpdmVycy9jcnlw
dG8vY2NwL3RlZS1kZXYuaCB8ICAxICsKIDUgZmlsZXMgY2hhbmdlZCwgMzkgaW5zZXJ0aW9u
cygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvY3J5cHRvL2NjcC9zcC1kZXYuYyBiL2RyaXZl
cnMvY3J5cHRvL2NjcC9zcC1kZXYuYwppbmRleCAzNDY3ZjZkYjRmNTA1Li5lM2ZhOTRkMTQw
MjZiIDEwMDY0NAotLS0gYS9kcml2ZXJzL2NyeXB0by9jY3Avc3AtZGV2LmMKKysrIGIvZHJp
dmVycy9jcnlwdG8vY2NwL3NwLWRldi5jCkBAIC0yMSw2ICsyMSw3IEBACiAKICNpbmNsdWRl
ICJzZXYtZGV2LmgiCiAjaW5jbHVkZSAiY2NwLWRldi5oIgorI2luY2x1ZGUgInRlZS1kZXYu
aCIKICNpbmNsdWRlICJzcC1kZXYuaCIKIAogTU9EVUxFX0FVVEhPUigiVG9tIExlbmRhY2t5
IDx0aG9tYXMubGVuZGFja3lAYW1kLmNvbT4iKTsKQEAgLTIzMCw2ICsyMzEsMTggQEAgaW50
IHNwX3Jlc3VtZShzdHJ1Y3Qgc3BfZGV2aWNlICpzcCkKIAlyZXR1cm4gMDsKIH0KIAoraW50
IHNwX3Jlc3RvcmUoc3RydWN0IHNwX2RldmljZSAqc3ApCit7CisJaWYgKHNwLT5kZXZfdmRh
dGEtPnBzcF92ZGF0YS0+dGVlKSB7CisJCWludCByID0gdGVlX3Jlc3RvcmUoc3AtPnBzcF9k
YXRhKTsKKworCQlpZiAocikKKwkJCXJldHVybiByOworCX0KKworCXJldHVybiBzcF9yZXN1
bWUoc3ApOworfQorCiBzdHJ1Y3Qgc3BfZGV2aWNlICpzcF9nZXRfcHNwX21hc3Rlcl9kZXZp
Y2Uodm9pZCkKIHsKIAlzdHJ1Y3Qgc3BfZGV2aWNlICppLCAqcmV0ID0gTlVMTDsKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvY3J5cHRvL2NjcC9zcC1kZXYuaCBiL2RyaXZlcnMvY3J5cHRvL2Nj
cC9zcC1kZXYuaAppbmRleCA2ZjlkNzA2MzI1N2Q3Li4zN2IzOGFmYWFiMTQ3IDEwMDY0NAot
LS0gYS9kcml2ZXJzL2NyeXB0by9jY3Avc3AtZGV2LmgKKysrIGIvZHJpdmVycy9jcnlwdG8v
Y2NwL3NwLWRldi5oCkBAIC0xNDEsNiArMTQxLDcgQEAgdm9pZCBzcF9kZXN0cm95KHN0cnVj
dCBzcF9kZXZpY2UgKnNwKTsKIAogaW50IHNwX3N1c3BlbmQoc3RydWN0IHNwX2RldmljZSAq
c3ApOwogaW50IHNwX3Jlc3VtZShzdHJ1Y3Qgc3BfZGV2aWNlICpzcCk7CitpbnQgc3BfcmVz
dG9yZShzdHJ1Y3Qgc3BfZGV2aWNlICpzcCk7CiBpbnQgc3BfcmVxdWVzdF9jY3BfaXJxKHN0
cnVjdCBzcF9kZXZpY2UgKnNwLCBpcnFfaGFuZGxlcl90IGhhbmRsZXIsCiAJCSAgICAgICBj
b25zdCBjaGFyICpuYW1lLCB2b2lkICpkYXRhKTsKIHZvaWQgc3BfZnJlZV9jY3BfaXJxKHN0
cnVjdCBzcF9kZXZpY2UgKnNwLCB2b2lkICpkYXRhKTsKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Y3J5cHRvL2NjcC9zcC1wY2kuYyBiL2RyaXZlcnMvY3J5cHRvL2NjcC9zcC1wY2kuYwppbmRl
eCA4ODkxY2VlZTFkN2QwLi40NzQwNmE2ZjE1MGJmIDEwMDY0NAotLS0gYS9kcml2ZXJzL2Ny
eXB0by9jY3Avc3AtcGNpLmMKKysrIGIvZHJpdmVycy9jcnlwdG8vY2NwL3NwLXBjaS5jCkBA
IC0zNTMsNiArMzUzLDEzIEBAIHN0YXRpYyBpbnQgX19tYXliZV91bnVzZWQgc3BfcGNpX3Jl
c3VtZShzdHJ1Y3QgZGV2aWNlICpkZXYpCiAJcmV0dXJuIHNwX3Jlc3VtZShzcCk7CiB9CiAK
K3N0YXRpYyBpbnQgX19tYXliZV91bnVzZWQgc3BfcGNpX3Jlc3RvcmUoc3RydWN0IGRldmlj
ZSAqZGV2KQoreworCXN0cnVjdCBzcF9kZXZpY2UgKnNwID0gZGV2X2dldF9kcnZkYXRhKGRl
dik7CisKKwlyZXR1cm4gc3BfcmVzdG9yZShzcCk7Cit9CisKICNpZmRlZiBDT05GSUdfQ1JZ
UFRPX0RFVl9TUF9QU1AKIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgc2V2X3ZkYXRhIHNldnYxID0g
ewogCS5jbWRyZXNwX3JlZwkJPSAweDEwNTgwLAkvKiBDMlBNU0dfMzIgKi8KQEAgLTU2NSw2
ICs1NzIsMTUgQEAgTU9EVUxFX0RFVklDRV9UQUJMRShwY2ksIHNwX3BjaV90YWJsZSk7CiAK
IHN0YXRpYyBTSU1QTEVfREVWX1BNX09QUyhzcF9wY2lfcG1fb3BzLCBzcF9wY2lfc3VzcGVu
ZCwgc3BfcGNpX3Jlc3VtZSk7CiAKK2NvbnN0IHN0cnVjdCBkZXZfcG1fb3BzIGkyY19oaWRf
Y29yZV9wbSA9IHsKKwkuc3VzcGVuZCA9IHBtX3NsZWVwX3B0cihzcF9wY2lfc3VzcGVuZCks
CisJLnJlc3VtZSA9IHBtX3NsZWVwX3B0cihzcF9wY2lfcmVzdW1lKSwKKwkuZnJlZXplID0g
cG1fc2xlZXBfcHRyKHNwX3BjaV9zdXNwZW5kKSwKKwkudGhhdyA9IHBtX3NsZWVwX3B0cihz
cF9wY2lfcmVzdW1lKSwKKwkucG93ZXJvZmYgPSBwbV9zbGVlcF9wdHIoc3BfcGNpX3N1c3Bl
bmQpLAorCS5yZXN0b3JlID0gcG1fc2xlZXBfcHRyKHNwX3BjaV9yZXN0b3JlKSwKK307CisK
IHN0YXRpYyBzdHJ1Y3QgcGNpX2RyaXZlciBzcF9wY2lfZHJpdmVyID0gewogCS5uYW1lID0g
ImNjcCIsCiAJLmlkX3RhYmxlID0gc3BfcGNpX3RhYmxlLApkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9jcnlwdG8vY2NwL3RlZS1kZXYuYyBiL2RyaXZlcnMvY3J5cHRvL2NjcC90ZWUtZGV2LmMK
aW5kZXggNWUxZDgwNzI0Njc4ZC4uYTc0NzA0NzcxMTdkNiAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9jcnlwdG8vY2NwL3RlZS1kZXYuYworKysgYi9kcml2ZXJzL2NyeXB0by9jY3AvdGVlLWRl
di5jCkBAIC0zNjUsMyArMzY1LDExIEBAIGludCBwc3BfY2hlY2tfdGVlX3N0YXR1cyh2b2lk
KQogCXJldHVybiAwOwogfQogRVhQT1JUX1NZTUJPTChwc3BfY2hlY2tfdGVlX3N0YXR1cyk7
CisKK2ludCB0ZWVfcmVzdG9yZShzdHJ1Y3QgcHNwX2RldmljZSAqcHNwKQoreworCWlmICgh
cHNwIHx8ICFwc3AtPnRlZV9kYXRhKQorCQlyZXR1cm4gLUVOT0RFVjsKKworCXJldHVybiB0
ZWVfaW5pdF9yaW5nKHBzcC0+dGVlX2RhdGEpOworfQpcIE5vIG5ld2xpbmUgYXQgZW5kIG9m
IGZpbGUKZGlmZiAtLWdpdCBhL2RyaXZlcnMvY3J5cHRvL2NjcC90ZWUtZGV2LmggYi9kcml2
ZXJzL2NyeXB0by9jY3AvdGVlLWRldi5oCmluZGV4IGVhOWEyYjdjMDVmNTcuLmMyMzQxNmNi
N2JiMzcgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvY3J5cHRvL2NjcC90ZWUtZGV2LmgKKysrIGIv
ZHJpdmVycy9jcnlwdG8vY2NwL3RlZS1kZXYuaApAQCAtMTExLDUgKzExMSw2IEBAIHN0cnVj
dCB0ZWVfcmluZ19jbWQgewogCiBpbnQgdGVlX2Rldl9pbml0KHN0cnVjdCBwc3BfZGV2aWNl
ICpwc3ApOwogdm9pZCB0ZWVfZGV2X2Rlc3Ryb3koc3RydWN0IHBzcF9kZXZpY2UgKnBzcCk7
CitpbnQgdGVlX3Jlc3RvcmUoc3RydWN0IHBzcF9kZXZpY2UgKnBzcCk7CiAKICNlbmRpZiAv
KiBfX1RFRV9ERVZfSF9fICovCi0tIAoyLjQzLjAKCg==

--------------0tayBGuDNFaO500xo9N5Y2hH--
