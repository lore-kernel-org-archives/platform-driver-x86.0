Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF4FAC4332F
	for <platform-driver-x86@archiver.kernel.org>; Wed,  9 Nov 2022 21:02:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232129AbiKIVCZ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 9 Nov 2022 16:02:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231666AbiKIVBu (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 9 Nov 2022 16:01:50 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6C3E31234
        for <platform-driver-x86@vger.kernel.org>; Wed,  9 Nov 2022 12:59:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1668027562;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type;
        bh=ZEZeGZH9mpiieBDsHIjdQc3Ke74WQQ9Mz7Mjgxh8q4w=;
        b=EhrLtkL9B61LljjQHW6VMNHlWHa8UvR9Hp2vm5W5jG/FRKglemJyqLfaC72b9Mii/kC44g
        Lcic7kgY/pIcQOLrbtaw9Ygx9ZRGy/n8c1RuA5s2FemzXDr3tcMefLmkAZFXVbozr31SCZ
        2b/hUKsEGhkjkJlnE7aeB0AWTnivrcg=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-648-oOIJb5t9NFmiUcmadw7fcQ-1; Wed, 09 Nov 2022 15:59:19 -0500
X-MC-Unique: oOIJb5t9NFmiUcmadw7fcQ-1
Received: by mail-ej1-f71.google.com with SMTP id oz34-20020a1709077da200b007adc8d68e90so11011119ejc.11
        for <platform-driver-x86@vger.kernel.org>; Wed, 09 Nov 2022 12:59:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:subject:from:to:content-language:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZEZeGZH9mpiieBDsHIjdQc3Ke74WQQ9Mz7Mjgxh8q4w=;
        b=0gIG69bh5OgGd8gxQ19Luq+hk2wFpfow+MP7iCRwQXVyccjNMGvfD+Mrpea8dQEAsQ
         qg8VxK0qnCaeJjX0215VzMehOy6aarbc0Jqbxf8tDwrf+cu18Q1dI/MW8HcjZHQzNbN2
         FtKt2CiuboFuKArqL6P+UIjIqgdWTvnzZ/wbDVRxdjCLXdN4kKlsiOv72FxiDV1hOWmS
         LWF1JIv2DwdI4ihWbWf6fgiCGyk4eefb8gyodi//DUjQ1sNf9d0bhVek44kMOG+MvAJa
         u6UAZsB68oJI3dgY+CeLr5QDGEWBTtHl+9O7IvVKqy9RZQwLoo6usdtbWrScokOuMurV
         z55Q==
X-Gm-Message-State: ACrzQf3NpdvaB8qOsL3dbGSsuCxZUm9gzlMshBCgr8qVdaCkYt8akpN1
        g+jofzEn9C6vN45ZX5QYM8wWgI78PcOxV2B8xWrgV+dJDMmFpCRKe22LSHeymtsAc/9ILFfL7do
        0MXM50SVw952Y38cRBEnuGhnmm5imiI+lYw==
X-Received: by 2002:a05:6402:1497:b0:462:c929:7e89 with SMTP id e23-20020a056402149700b00462c9297e89mr62152450edv.149.1668027557556;
        Wed, 09 Nov 2022 12:59:17 -0800 (PST)
X-Google-Smtp-Source: AMsMyM72gcLsCVW6tZfNt66JAzOnGB5Lk9jN9MWb/ZmvAjRYHTzNboOd0oD40oe2hkMKsFDg9cs1Uw==
X-Received: by 2002:a05:6402:1497:b0:462:c929:7e89 with SMTP id e23-20020a056402149700b00462c9297e89mr62152440edv.149.1668027557350;
        Wed, 09 Nov 2022 12:59:17 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id h3-20020a1709066d8300b0074136cac2e7sm6246377ejt.81.2022.11.09.12.59.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Nov 2022 12:59:16 -0800 (PST)
Content-Type: multipart/mixed; boundary="------------1EohqzXWUbhVSp6z36PuMLaN"
Message-ID: <bc1202d1-d85d-4173-5979-237bb1ee9254@redhat.com>
Date:   Wed, 9 Nov 2022 21:59:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Content-Language: en-US, nl
To:     Maxim Mikityanskiy <maxtram95@gmail.com>,
        GOESSEL Guillaume <g_goessel@outlook.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Matthew Garrett <mjg59@srcf.ucam.org>,
        Manyi Li <limanyi@uniontech.com>,
        =?UTF-8?Q?Eray_Or=c3=a7unus?= <erayorcunus@gmail.com>,
        Ike Panhc <ike.pan@canonical.com>
From:   Hans de Goede <hdegoede@redhat.com>
Subject: ideapad-laptop touchpad handling problems, request for help
Cc:     "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

This is a multi-part message in MIME format.
--------------1EohqzXWUbhVSp6z36PuMLaN
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi All,

I'm emailing you all because you have written patches or
reported bugs related to the ideapad-laptop touchpad
handling the past.

1. History
==========

I have done a bit of digging into the history of
the touchpad handling:

What I believe is the troublesome part of the touchpad handling
started in 2012 with:

07a4a4fc83dd ("ideapad: add Lenovo IdeaPad Z570 support (part 2)")
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=07a4a4fc83dd

Which added the ideapad_sync_touchpad_state() function which depending
on the result of reading VPCCMD_R_TOUCHPAD send an i8042 command to
enable/disable the aux port of the ps2 controller *and* which sends
KEY_TOUCHPAD_OFF/KEY_TOUCHPAD_ON events to userspace to let userspace
know the state of the touchpad.

The first commit to optionally disable ideapad_sync_touchpad_state()
was actually written by me in 2014, for a "Lenovo Yoga 2 11":

f79a901331a8 ("ideapad-laptop: Disable touchpad interface on Yoga models")
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=f79a901331a8

The problem on the "Lenovo Yoga 2 11" was a spurious KEY_TOUCHPAD_OFF
event on resume, other then that there were no bad side effects.

This patch got reverted soon afterwards in commit 3b264d279e72 because
it stopped the touchpad enable/disable button from working on
a "Lenovo Yoga 2 13".

Then in 2021 a patch was added to again disable ideapad_sync_touchpad_state()
on some models, this time based on the ACPI HID (ELAN0634) of the touchpad:

d69cd7eea93e ("platform/x86: ideapad-laptop: Disable touchpad_switch for ELAN0634")
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=d69cd7eea93e

And the last couple of weeks the following 2 patches were added to disable
ideapad_sync_touchpad_state() on more models based on DMI ids for the first
patch (already merged) + adding a new ACPI HID for the second patch:

a231224a601c ("platform/x86: ideapad-laptop: Disable touchpad_switch")
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=a231224a601c

https://patchwork.kernel.org/project/platform-driver-x86/patch/20221029120311.11152-8-erayorcunus@gmail.com/

As mentioned in the commit msg of d69cd7eea93e ("platform/x86:
ideapad-laptop: Disable touchpad_switch for ELAN0634") part of
the problem is VPCCMD_R_TOUCHPAD returning 0 leading to the aux
ps/2 port getting turned off.

This can be a problem even on devices where the touchpad shows up as
an i2c/smbus device because often on those devices the touchpad is
connected over both ps/2 + i2c and at least for synaptics devices
the touchpad needs to be contacted over i2c within a couple of
100s of ms of doing a ps/2 reset for it to switch to i2c mode.


2. Possible solutions
=====================

1. Do something with BIOS date to only enable touchpad_ctrl_via_ec on
older models. Problem is that BIOS updates happen and those can be
of much later date then the production year of the model

2. Move to an allow list for setting touchpad_ctrl_via_ec to true, given
how soon after my initial patch to disable touchpad_ctrl_via_ec I got
a bug report about this, which even was due to a deny-list DMI entry
not being narrow enough this seems like a bad idea. OTOH missing
the ability to turn the touchpad on/off is less of a big deal
then a non working touchpad. So if we fail to find a better
solution this might be the best thing to do.

3. Since the problems are caused when VPCCMD_R_TOUCHPAD reads as 0 at
boot, causing ideapad_sync_touchpad_state() to turn off the ps/2 aux port
and since the touchpad is normally on at boot, we can check for
VPCCMD_R_TOUCHPAD reading as 0 at boot and if that happens assume that
means touchpad-ctrl via the EC is not available. I have attached
a patch implementing this approach.


3. Please test
==============

If you have ideapads where touchpad_ctrl_via_ec should be 1 because
it is needed to toggle the touchpad on/off with the hotkey.

Or the exact opposite you have ideapads where it should be disabled
because ideapad_sync_touchpad_state() turning off the ps/2 aux port
is causing problems.

Then please give the attached patch a try. Note this applies on
top of Torvald's current master, or on top of 6.0 with :
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=a231224a601c
added.

Regards,

Hans


--------------1EohqzXWUbhVSp6z36PuMLaN
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-platform-x86-ideapad-laptop-Improve-touchpad_ctrl_vi.patch"
Content-Disposition: attachment;
 filename*0="0001-platform-x86-ideapad-laptop-Improve-touchpad_ctrl_vi.pa";
 filename*1="tch"
Content-Transfer-Encoding: base64

RnJvbSBjNTJmMjI4NmU0MDI5MWNiNzMzN2U5ZTlkNzk2NjM2NTgyOGQ4ZDNkIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBIYW5zIGRlIEdvZWRlIDxoZGVnb2VkZUByZWRoYXQu
Y29tPgpEYXRlOiBXZWQsIDkgTm92IDIwMjIgMjE6Mzk6MzcgKzAxMDAKU3ViamVjdDogW1BB
VENIXSBwbGF0Zm9ybS94ODY6IGlkZWFwYWQtbGFwdG9wOiBJbXByb3ZlIHRvdWNocGFkX2N0
cmxfdmlhX2VjCiBkZXRlY3Rpb24KTUlNRS1WZXJzaW9uOiAxLjAKQ29udGVudC1UeXBlOiB0
ZXh0L3BsYWluOyBjaGFyc2V0PVVURi04CkNvbnRlbnQtVHJhbnNmZXItRW5jb2Rpbmc6IDhi
aXQKCk9uIG5ld2VyIGlkZWFwYWRzIHRvdWNocGFkIGN0cmwgdmlhIHRoZSBFQyBpcyBub3Qg
YXZhaWxhYmxlIGFuZCBhbGxvd2luZwppZGVhcGFkX3N5bmNfdG91Y2hwYWRfc3RhdGUoKSB0
byB0dXJuIG9mIHRoZSBQUy8yIGF1eCBwb3J0IG9uIGEgMCByZWFkCmZyb20gVlBDQ01EX1Jf
VE9VQ0hQQUQgc3RvcHMgdGhlIHRvdWNocGFkIGZyb20gd29ya2luZy4KClNvIGZhciB3ZSBo
YXZlIGJlZW4gdXNpbmcgYSBkZW55LWxpc3QgYmFzZWQgYXBwcm9hY2ggdG8gZGlzYWJsZQpp
ZGVhcGFkX3N5bmNfdG91Y2hwYWRfc3RhdGUoKSBvbiBtb2RlbHMgd2hlcmUgaXQgaXMgY2F1
c2luZyBpc3N1ZXMKYmFzZWQgb24gYSBtaXggb2YgdG91Y2hwYWQgQUNQSS1ISUQgKyBETUkg
c3RyaW5nIG1hdGNoZXMuIEJ1dCB0aGlzCmRvZXMgbm90IHdvcmsgd2VsbCAoaXQgcmVzdWx0
cyBpbiBhIGdhbWUgb2Ygd2hhY2sgYSBtb2xlKS4KClNpbmNlIGlkZWFwYWRfc3luY190b3Vj
aHBhZF9zdGF0ZSgpIGNhdXNlcyB0aGUgcHJvYmxlbSBvbmx5IHdoZW4KVlBDQ01EX1JfVE9V
Q0hQQUQgcmVhZHMgMCBhbmQgc2luY2Ugbm9ybWFsbHkgdGhlIHRvdWNocGFkIGlzIGFsd2F5
cwpvbiBhdCBib290LCBzbyBWUENDTURfUl9UT1VDSFBBRCBzaG91bGQgcmVhZCBhcyAxLCB3
ZSBjYW4gYXZvaWQKbW9kZWxzIG9uIHdoaWNoIHRvdWNocGFkX2N0cmxfdmlhX2VjIGNhdXNl
cyBwcm9ibGVtcyBieSBvbmx5IGFsbG93aW5nCnRvdWNocGFkX2N0cmxfdmlhX2VjIHdoZW4g
VlBDQ01EX1JfVE9VQ0hQQUQgcmVhZHMgbm9uIDAgYXQgYm9vdC4KCkZpeGVzOiBkNjljZDdl
ZWE5M2UgKCJwbGF0Zm9ybS94ODY6IGlkZWFwYWQtbGFwdG9wOiBEaXNhYmxlIHRvdWNocGFk
X3N3aXRjaCBmb3IgRUxBTjA2MzQiKQpGaXhlczogYTIzMTIyNGE2MDFjICgicGxhdGZvcm0v
eDg2OiBpZGVhcGFkLWxhcHRvcDogRGlzYWJsZSB0b3VjaHBhZF9zd2l0Y2giKQpDYzogTWF4
aW0gTWlraXR5YW5za2l5IDxtYXh0cmFtOTVAZ21haWwuY29tPgpDYzogR09FU1NFTCBHdWls
bGF1bWUgPGdfZ29lc3NlbEBvdXRsb29rLmNvbT4KQ2M6IEppYXh1biBZYW5nIDxqaWF4dW4u
eWFuZ0BmbHlnb2F0LmNvbT4KQ2M6IE1hbnlpIExpIDxsaW1hbnlpQHVuaW9udGVjaC5jb20+
CkNjOiBFcmF5IE9yw6d1bnVzIDxlcmF5b3JjdW51c0BnbWFpbC5jb20+CkNjOiBJa2UgUGFu
aGMgPGlrZS5wYW5AY2Fub25pY2FsLmNvbT4KU2lnbmVkLW9mZi1ieTogSGFucyBkZSBHb2Vk
ZSA8aGRlZ29lZGVAcmVkaGF0LmNvbT4KLS0tCiBkcml2ZXJzL3BsYXRmb3JtL3g4Ni9pZGVh
cGFkLWxhcHRvcC5jIHwgMzcgKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tCiAxIGZpbGUg
Y2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKSwgMjUgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9wbGF0Zm9ybS94ODYvaWRlYXBhZC1sYXB0b3AuYyBiL2RyaXZlcnMvcGxh
dGZvcm0veDg2L2lkZWFwYWQtbGFwdG9wLmMKaW5kZXggMzNiM2RmZGQxYjA4Li40OTllNzVj
ODQ0NzYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvcGxhdGZvcm0veDg2L2lkZWFwYWQtbGFwdG9w
LmMKKysrIGIvZHJpdmVycy9wbGF0Zm9ybS94ODYvaWRlYXBhZC1sYXB0b3AuYwpAQCAtMTUz
MywzOCArMTUzMywyNSBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGRtaV9zeXN0ZW1faWQgaHdf
cmZraWxsX2xpc3RbXSA9IHsKIAl7fQogfTsKIAotc3RhdGljIGNvbnN0IHN0cnVjdCBkbWlf
c3lzdGVtX2lkIG5vX3RvdWNocGFkX3N3aXRjaF9saXN0W10gPSB7Ci0JewotCS5pZGVudCA9
ICJMZW5vdm8gWW9nYSAzIFBybyAxMzcwIiwKLQkubWF0Y2hlcyA9IHsKLQkJRE1JX01BVENI
KERNSV9TWVNfVkVORE9SLCAiTEVOT1ZPIiksCi0JCURNSV9NQVRDSChETUlfUFJPRFVDVF9W
RVJTSU9OLCAiTGVub3ZvIFlPR0EgMyIpLAotCQl9LAotCX0sCi0JewotCS5pZGVudCA9ICJa
aGFvWWFuZyBLNGUtSU1MIiwKLQkubWF0Y2hlcyA9IHsKLQkJRE1JX01BVENIKERNSV9TWVNf
VkVORE9SLCAiTEVOT1ZPIiksCi0JCURNSV9NQVRDSChETUlfUFJPRFVDVF9WRVJTSU9OLCAi
Wmhhb1lhbmcgSzRlLUlNTCIpLAotCQl9LAotCX0sCi0Je30KLX07Ci0KIHN0YXRpYyB2b2lk
IGlkZWFwYWRfY2hlY2tfZmVhdHVyZXMoc3RydWN0IGlkZWFwYWRfcHJpdmF0ZSAqcHJpdikK
IHsKIAlhY3BpX2hhbmRsZSBoYW5kbGUgPSBwcml2LT5hZGV2LT5oYW5kbGU7CiAJdW5zaWdu
ZWQgbG9uZyB2YWw7CisJaW50IHJldDsKIAogCXByaXYtPmZlYXR1cmVzLmh3X3Jma2lsbF9z
d2l0Y2ggPSBkbWlfY2hlY2tfc3lzdGVtKGh3X3Jma2lsbF9saXN0KTsKIAotCS8qIE1vc3Qg
aWRlYXBhZHMgd2l0aCBFTEFOMDYzNCB0b3VjaHBhZCBkb24ndCB1c2UgRUMgdG91Y2hwYWQg
c3dpdGNoICovCi0JaWYgKGFjcGlfZGV2X3ByZXNlbnQoIkVMQU4wNjM0IiwgTlVMTCwgLTEp
KQotCQlwcml2LT5mZWF0dXJlcy50b3VjaHBhZF9jdHJsX3ZpYV9lYyA9IDA7Ci0JZWxzZSBp
ZiAoZG1pX2NoZWNrX3N5c3RlbShub190b3VjaHBhZF9zd2l0Y2hfbGlzdCkpCi0JCXByaXYt
PmZlYXR1cmVzLnRvdWNocGFkX2N0cmxfdmlhX2VjID0gMDsKLQllbHNlCi0JCXByaXYtPmZl
YXR1cmVzLnRvdWNocGFkX2N0cmxfdmlhX2VjID0gMTsKKwkvKgorCSAqIE9uIG5ld2VyIGlk
ZWFwYWRzIHRvdWNocGFkIGN0cmwgdmlhIHRoZSBFQyBpcyBub3QgYXZhaWxhYmxlIGFuZAor
CSAqIGFsbG93aW5nIGlkZWFwYWRfc3luY190b3VjaHBhZF9zdGF0ZSgpIHRvIHR1cm4gb2Yg
dGhlIFBTLzIgYXV4CisJICogcG9ydCBvbiBhIDAgcmVhZCBmcm9tIFZQQ0NNRF9SX1RPVUNI
UEFEIHN0b3BzIHRoZSB0b3VjaHBhZCBmcm9tCisJICogd29ya2luZy4KKwkgKgorCSAqIEFz
c3VtZSB0aGF0IHRoZSB0b3VjaHBhZCBpcyBhbHdheXMgb24gYXQgYm9vdCBhbmQgdGhhdCBh
IDAgcmVhZAorCSAqIGZyb20gVlBDQ01EX1JfVE9VQ0hQQUQgbWVhbnMgRUMgdG91Y2hwYWQg
Y3RybCBpcyBub3QgYXZhaWxhYmxlLgorCSAqLworCXJldCA9IHJlYWRfZWNfZGF0YShwcml2
LT5hZGV2LT5oYW5kbGUsIFZQQ0NNRF9SX1RPVUNIUEFELCAmdmFsKTsKKwlwcml2LT5mZWF0
dXJlcy50b3VjaHBhZF9jdHJsX3ZpYV9lYyA9IHJldCA9PSAwICYmIHZhbCAhPSAwOwogCiAJ
aWYgKCFyZWFkX2VjX2RhdGEoaGFuZGxlLCBWUENDTURfUl9GQU4sICZ2YWwpKQogCQlwcml2
LT5mZWF0dXJlcy5mYW5fbW9kZSA9IHRydWU7Ci0tIAoyLjM3LjMKCg==

--------------1EohqzXWUbhVSp6z36PuMLaN--

