Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30F63C197A0
	for <platform-driver-x86@archiver.kernel.org>; Mon, 20 Nov 2023 14:18:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233479AbjKTOSZ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 20 Nov 2023 09:18:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233422AbjKTOSY (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 20 Nov 2023 09:18:24 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D7F6ED
        for <platform-driver-x86@vger.kernel.org>; Mon, 20 Nov 2023 06:18:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1700489899;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=7Ya4ZPg+oKujyx8lvINLD/4wP78ea79OecOdQoQ874k=;
        b=b/WkLDeySNfPP4Zg6sxzT204v9U7CrCCN6wIkFlQxDBAA+Sd59BBT+jxsovvjlC2bh0SPO
        ps4tgNENHiEyLgcKqWVjYnaxw1FLqMh5piFkSaEqrqb8Xy+Nl+TJABgvb2Lt6RYO2ZRL08
        AN3ooPLUguJ4EXZ6jjBwPelS1TrABm4=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-595-GnwESLQGNPmyzSUwJHDQeg-1; Mon, 20 Nov 2023 09:18:17 -0500
X-MC-Unique: GnwESLQGNPmyzSUwJHDQeg-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-9cf3fad5baeso323384166b.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 20 Nov 2023 06:18:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700489896; x=1701094696;
        h=in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7Ya4ZPg+oKujyx8lvINLD/4wP78ea79OecOdQoQ874k=;
        b=n/Ytswp0OW1vA+nhGbZyG1kxsHptjGIVYz2gYufkxoTCMrjdJIma/4nf8mWF8M60Ez
         FmmYkV3uyiPTWcCNBvusg3/3jSGlzvalicaCbMhUyDPvXMLgRb3qxIw7jXlpDVnfsthi
         GqhsWDkjg1xjJzl8U7e06+hQ/D899hUoH24EIOMXdbG5iRq849R3T8h/yC67aMS+JufZ
         g2dtZjJLLDGcy6hBsnIFY4VFZY8JPeAH9oYT9cDrTrlDRZNFnhZz4HGHgpJrluhk4i1S
         cM3MG6zZPjgrSWNYz2+CRRI5fZ4+YDwExH2EPa0HtdALk+wD7M/fJsq/0YXBfyEYIlYB
         RjhA==
X-Gm-Message-State: AOJu0YyjkwGMMIUt6OZp7/k1/tWeTFhPM/9Vek1K17qdmZFaLDGQC+rd
        H4YlsfOS8BC+O9qz/JlQpgvVtC20JVUsYMtLR04cV8rWwXUbAJ8SJYzGMO2yNUOEOPLI1Y5ZIw6
        SDn1MZm51S1Xgxs1wR9YPDkuO0zr088b0Jg==
X-Received: by 2002:a17:906:256:b0:a00:3bc8:d481 with SMTP id 22-20020a170906025600b00a003bc8d481mr998795ejl.16.1700489896499;
        Mon, 20 Nov 2023 06:18:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHzrI+sWCntpK2jXyZdvwQ5RpnbjaP9Fb8gzY/jsyDroEAaRp2Wo0t5jePU49DTVFTixACvMA==
X-Received: by 2002:a17:906:256:b0:a00:3bc8:d481 with SMTP id 22-20020a170906025600b00a003bc8d481mr998771ejl.16.1700489896087;
        Mon, 20 Nov 2023 06:18:16 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a1-20020a170906190100b009a19701e7b5sm3952196eje.96.2023.11.20.06.18.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Nov 2023 06:18:15 -0800 (PST)
Content-Type: multipart/mixed; boundary="------------aEyTC6dkn6AHwH7YWHZ0zcX5"
Message-ID: <674140cc-fb03-4751-9bdf-13e86a6d39cc@redhat.com>
Date:   Mon, 20 Nov 2023 15:18:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Bug Report] intel/vbtn: Dell Inspiron 7352 has unreliable
 tablet-mode switch
Content-Language: en-US, nl
To:     Arnold Gozum <arngozum@gmail.com>,
        AceLan Kao <acelan.kao@canonical.com>
Cc:     platform-driver-x86@vger.kernel.org
References: <87271a74-c831-4eec-b7a4-1371d0e42471@gmail.com>
 <CAFv23Qm+-p7U5N8JpJmqNxHnN7bTT3fxQJ5O0ainRrqnvrmB7g@mail.gmail.com>
 <c6402969-a372-44ad-a540-79d4ee60e190@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <c6402969-a372-44ad-a540-79d4ee60e190@gmail.com>
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

This is a multi-part message in MIME format.
--------------aEyTC6dkn6AHwH7YWHZ0zcX5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Arnold,

Thank you for reporting this.

Unfortunately removing the Dell Inspiron 7352 from
the dmi_switches_allow_list will not help.

The intel-vbtn driver now a days also creates an input-device
with a tablet-switch upon receiving the first tablet-switch
related event, to avoid needing to maintain an ever growing
list of devices on the allow-list.

And since the Dell Inspiron 7352 does have a somewhat working
tablet-mode-switch it does send such events. So removing it
from the allow-list will only result in the creation of
an input-device for the tablet-mode-switch being delayed till
the first event.

Now we could add a dmi_switches_deny_list for this purpose,
but first lets see if we can fix things.

On 10/29/23 20:52, Arnold Gozum wrote:
> Hi, sorry for the delayed reply. Your patch doesn't seem to work, I
> still have the issue where the switch is in the wrong state after
> suspend/resume.

Ok, so this does sound like the issue where the switch completely
stops reporting state-changes is fixed with the addition of
the extra "VBDL" call ?

I think that the wrong mode after suspend/resume is just a matter
of manually checking the mode after a suspend/resume.

Can you give the attached patch a try and see if that fixes things ?

Regards,

Hans




> And yes, it's been a while, and I believe the issues did exist during
> that time however it was easy to ignore/forget since I'm on X11 where
> libinput doesn't respond to tablet mode switches, so I neglected to
> report the issue for a while. Also, about the BIOS, I'm a little
> hesistant to update it since I don't have a battery. I have version A11
> and the newest is A15, but Dell's update notes only mention security
> fixes, so maybe it doesn't matter.
> 
> On 2023-10-17 22:05, AceLan Kao wrote:
>> Arnold Gozum <arngozum@gmail.com> 於 2023年10月18日 週三 上午8:53寫道：
>>>
>>> Hi,
>>>
>>> In Linux 5.11, Dell Inspiron 7352 was added to the
>>> dmi_switches_allow_list as it is a 2-in-1 which reports a chassis type
>>> 10 (actually it was me who submitted the patch).
>>>
>>> However, the tablet mode switch can be unreliable. Randomly, switch
>>> events stop being reported and SW_TABLET_MODE will by stuck at 1 or 0,
>>> which I have tested by running evtest while flipping the device to and
>>> from tablet mode. This is fixed after a reboot, or a suspend followed by
>>> unloading and reloading the intel-vbtn module. It can also sometimes be
>>> the case that upon resume, SW_TABLET_MODE does not reflect the actual
>>> state of the device, which is fixed by physically flipping the screen
>>> back and forth to update the state.
>>>
>>> Because of these issues, I think this model should be removed from the
>>> allow list, unless more investigation should be done.
>> Hi Arnold,
>>
>> It's been a long time since you submitted the patch. Did those issues
>> not occur during that time?
>> Have you tried updating the BIOS to see if it helps?
>>
>> From your description, I think calling VBDL might reset the status.
>> You might want to try it below.
>>
>> diff --git a/drivers/platform/x86/intel/vbtn.c
>> b/drivers/platform/x86/intel/vbtn.c
>> index 6fa1735ad7a49..681650f52ff22 100644
>> --- a/drivers/platform/x86/intel/vbtn.c
>> +++ b/drivers/platform/x86/intel/vbtn.c
>> @@ -198,6 +198,8 @@ static void notify_handler(acpi_handle handle, u32
>> event, void *context)
>>        autorelease = val && (!ke_rel || ke_rel->type == KE_IGNORE);
>>
>>        sparse_keymap_report_event(input_dev, event, val, autorelease);
>> +
>> +       acpi_evaluate_object(handle, "VBDL", NULL, NULL);
>> }
>>
>> /*
>>
>>>
>>> Thanks,
>>> Arnold
> 

--------------aEyTC6dkn6AHwH7YWHZ0zcX5
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-platform-x86-intel-vbtn-Fix-missing-tablet-mode-swit.patch"
Content-Disposition: attachment;
 filename*0="0001-platform-x86-intel-vbtn-Fix-missing-tablet-mode-swit.pa";
 filename*1="tch"
Content-Transfer-Encoding: base64

RnJvbSBkM2Y4OGRjMDA5YWY2YjE1ZDgxMzBiOTE3ZWQ3M2YyYWFkYmY2NmQ2IE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBIYW5zIGRlIEdvZWRlIDxoZGVnb2VkZUByZWRoYXQu
Y29tPgpEYXRlOiBNb24sIDIwIE5vdiAyMDIzIDE0OjU5OjA2ICswMTAwClN1YmplY3Q6IFtQ
QVRDSF0gcGxhdGZvcm0veDg2OiBpbnRlbC12YnRuOiBGaXggbWlzc2luZyB0YWJsZXQtbW9k
ZS1zd2l0Y2gKIGV2ZW50cwoKMiBpc3N1ZXMgaGF2ZSBiZWVuIHJlcG9ydGVkIG9uIHRoZSBE
ZWxsIEluc3Bpcm9uIDczNTI6CgoxLiBTb21ldGltZXMgdGhlIHRhYmxldC1tb2RlLXN3aXRj
aCBzdG9wcyByZXBvcnRpbmcgdGFibGV0LW1vZGUKICAgY2hhbmdlIGV2ZW50cy4KCiAgIEFk
ZCBhICJWQkRMIiBjYWxsIHRvIG5vdGlmeV9oYW5kbGVyKCkgdG8gd29yayBhcm91bmQgdGhp
cy4KCjIuIFNvbWV0aW1lcyB0aGUgdGFibGV0LW1vZGUgaXMgaW5jb3JyZWN0IGFmdGVyIHN1
c3BlbmQvcmVzdW1lCgogICBBZGQgYSBkZXRlY3RfdGFibGV0X21vZGUoKSB0byByZXN1bWUo
KSB0byBmaXggdGhpcy4KClJlcG9ydGVkLWJ5OiBBcm5vbGQgR296dW0gPGFybmdvenVtQGdt
YWlsLmNvbT4KQ2xvc2VzOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9wbGF0Zm9ybS1kcml2
ZXIteDg2Lzg3MjcxYTc0LWM4MzEtNGVlYy1iN2E0LTEzNzFkMGU0MjQ3MUBnbWFpbC5jb20v
ClNpZ25lZC1vZmYtYnk6IEhhbnMgZGUgR29lZGUgPGhkZWdvZWRlQHJlZGhhdC5jb20+Ci0t
LQogZHJpdmVycy9wbGF0Zm9ybS94ODYvaW50ZWwvdmJ0bi5jIHwgMTkgKysrKysrKysrKysr
KysrLS0tLQogMSBmaWxlIGNoYW5nZWQsIDE1IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25z
KC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9wbGF0Zm9ybS94ODYvaW50ZWwvdmJ0bi5jIGIv
ZHJpdmVycy9wbGF0Zm9ybS94ODYvaW50ZWwvdmJ0bi5jCmluZGV4IDZmYTE3MzVhZDdhNC4u
MjEwYjBhODFiN2VjIDEwMDY0NAotLS0gYS9kcml2ZXJzL3BsYXRmb3JtL3g4Ni9pbnRlbC92
YnRuLmMKKysrIGIvZHJpdmVycy9wbGF0Zm9ybS94ODYvaW50ZWwvdmJ0bi5jCkBAIC03Mywx
MCArNzMsMTAgQEAgc3RydWN0IGludGVsX3ZidG5fcHJpdiB7CiAJYm9vbCB3YWtldXBfbW9k
ZTsKIH07CiAKLXN0YXRpYyB2b2lkIGRldGVjdF90YWJsZXRfbW9kZShzdHJ1Y3QgcGxhdGZv
cm1fZGV2aWNlICpkZXZpY2UpCitzdGF0aWMgdm9pZCBkZXRlY3RfdGFibGV0X21vZGUoc3Ry
dWN0IGRldmljZSAqZGV2KQogewotCXN0cnVjdCBpbnRlbF92YnRuX3ByaXYgKnByaXYgPSBk
ZXZfZ2V0X2RydmRhdGEoJmRldmljZS0+ZGV2KTsKLQlhY3BpX2hhbmRsZSBoYW5kbGUgPSBB
Q1BJX0hBTkRMRSgmZGV2aWNlLT5kZXYpOworCXN0cnVjdCBpbnRlbF92YnRuX3ByaXYgKnBy
aXYgPSBkZXZfZ2V0X2RydmRhdGEoZGV2KTsKKwlhY3BpX2hhbmRsZSBoYW5kbGUgPSBBQ1BJ
X0hBTkRMRShkZXYpOwogCXVuc2lnbmVkIGxvbmcgbG9uZyB2Z2JzOwogCWFjcGlfc3RhdHVz
IHN0YXR1czsKIAlpbnQgbTsKQEAgLTg5LDYgKzg5LDggQEAgc3RhdGljIHZvaWQgZGV0ZWN0
X3RhYmxldF9tb2RlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKmRldmljZSkKIAlpbnB1dF9y
ZXBvcnRfc3dpdGNoKHByaXYtPnN3aXRjaGVzX2RldiwgU1dfVEFCTEVUX01PREUsIG0pOwog
CW0gPSAodmdicyAmIFZHQlNfRE9DS19NT0RFX0ZMQUcpID8gMSA6IDA7CiAJaW5wdXRfcmVw
b3J0X3N3aXRjaChwcml2LT5zd2l0Y2hlc19kZXYsIFNXX0RPQ0ssIG0pOworCisJaW5wdXRf
c3luYyhwcml2LT5zd2l0Y2hlc19kZXYpOwogfQogCiAvKgpAQCAtMTM0LDcgKzEzNiw3IEBA
IHN0YXRpYyBpbnQgaW50ZWxfdmJ0bl9pbnB1dF9zZXR1cChzdHJ1Y3QgcGxhdGZvcm1fZGV2
aWNlICpkZXZpY2UpCiAJcHJpdi0+c3dpdGNoZXNfZGV2LT5pZC5idXN0eXBlID0gQlVTX0hP
U1Q7CiAKIAlpZiAocHJpdi0+aGFzX3N3aXRjaGVzKSB7Ci0JCWRldGVjdF90YWJsZXRfbW9k
ZShkZXZpY2UpOworCQlkZXRlY3RfdGFibGV0X21vZGUoJmRldmljZS0+ZGV2KTsKIAogCQly
ZXQgPSBpbnB1dF9yZWdpc3Rlcl9kZXZpY2UocHJpdi0+c3dpdGNoZXNfZGV2KTsKIAkJaWYg
KHJldCkKQEAgLTE5OCw2ICsyMDAsOSBAQCBzdGF0aWMgdm9pZCBub3RpZnlfaGFuZGxlcihh
Y3BpX2hhbmRsZSBoYW5kbGUsIHUzMiBldmVudCwgdm9pZCAqY29udGV4dCkKIAlhdXRvcmVs
ZWFzZSA9IHZhbCAmJiAoIWtlX3JlbCB8fCBrZV9yZWwtPnR5cGUgPT0gS0VfSUdOT1JFKTsK
IAogCXNwYXJzZV9rZXltYXBfcmVwb3J0X2V2ZW50KGlucHV0X2RldiwgZXZlbnQsIHZhbCwg
YXV0b3JlbGVhc2UpOworCisJLyogU29tZSBkZXZpY2VzIG5lZWQgdGhpcyB0byByZXBvcnQg
ZnVydGhlciBldmVudHMgKi8KKwlhY3BpX2V2YWx1YXRlX29iamVjdChoYW5kbGUsICJWQkRM
IiwgTlVMTCwgTlVMTCk7CiB9CiAKIC8qCkBAIC0zNTIsNyArMzU3LDEzIEBAIHN0YXRpYyB2
b2lkIGludGVsX3ZidG5fcG1fY29tcGxldGUoc3RydWN0IGRldmljZSAqZGV2KQogCiBzdGF0
aWMgaW50IGludGVsX3ZidG5fcG1fcmVzdW1lKHN0cnVjdCBkZXZpY2UgKmRldikKIHsKKwlz
dHJ1Y3QgaW50ZWxfdmJ0bl9wcml2ICpwcml2ID0gZGV2X2dldF9kcnZkYXRhKGRldik7CisK
IAlpbnRlbF92YnRuX3BtX2NvbXBsZXRlKGRldik7CisKKwlpZiAocHJpdi0+aGFzX3N3aXRj
aGVzKQorCQlkZXRlY3RfdGFibGV0X21vZGUoZGV2KTsKKwogCXJldHVybiAwOwogfQogCi0t
IAoyLjQxLjAKCg==

--------------aEyTC6dkn6AHwH7YWHZ0zcX5--

