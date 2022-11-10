Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27F5CC433FE
	for <platform-driver-x86@archiver.kernel.org>; Thu, 10 Nov 2022 19:02:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230128AbiKJTCu (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 10 Nov 2022 14:02:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229595AbiKJTCt (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 10 Nov 2022 14:02:49 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 257D331FB9
        for <platform-driver-x86@vger.kernel.org>; Thu, 10 Nov 2022 11:01:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1668106914;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=yF/53kK5/UCV1orskiPCq9ZAksgm91qJboNO61AT3Ng=;
        b=gY4k9AQGgq9uaHRAxKAJJwU60s7vCcsIBm4ebGtHWNKVwxgSdmS6JKEugL6kSjCg/VxDRl
        KNRSrRFm8ItSQ+Ey7jz8taqqc69mD+MCHrfeIoCC53Zfu+pLiqlf9TUa8EPunvvPXlKD9Q
        ibPqVYn37VpLUL+Ax/YVEFBawu7OD+M=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-602-cyb87fg2Mxe6g87uOAyEjw-1; Thu, 10 Nov 2022 14:01:51 -0500
X-MC-Unique: cyb87fg2Mxe6g87uOAyEjw-1
Received: by mail-ej1-f72.google.com with SMTP id sg37-20020a170907a42500b007adaedb5ba2so1726337ejc.18
        for <platform-driver-x86@vger.kernel.org>; Thu, 10 Nov 2022 11:01:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yF/53kK5/UCV1orskiPCq9ZAksgm91qJboNO61AT3Ng=;
        b=FNjeg+Gd4OPEagXASRUyTUFcJxQDOO5Evz/OjwxWBB7014lUI26dVIi1U9Q9WyrrpE
         Pd9IZUKEdPpQphj3ahZx2tgNEl9nQ9dNpsrlTfmKGPI+xwYMZv25x5vQ07++ZQANkqGQ
         sJfWc4QWN3GuWOLdLMmwjNUtBBpFpJWLUf/OLo8LZpXY2UJaiZ6+jCLwUeVDCg8GcDs8
         pgH55EIcAuuBk9BY/JRTs+fgn+fQvwWVVNmvU8yObW2cGqEceIzLvqLU2a8VMtS2el4N
         FD/+Ch6Qho/BFF4nhNpsj3c0NbUzM7nmqX/MATZ+EsD6mnE6oD8LxqsUxCtIDEGTnaFs
         I34w==
X-Gm-Message-State: ACrzQf2pqmKG6snYdq1SItaVDpDj0AGpB+YEV9w6PCeZP7pzTqN+YO1n
        AraeyKesvu0IwUjai9wOxpC1maF3MoveNOvSTWdp+fyMHhFFUvbqlYEaR31BhSSJDO9AZ13PLqo
        YnuIuNbDH2QU3BWOXt4Y/KOMYisqZRLPAMQ==
X-Received: by 2002:a05:6402:cad:b0:459:7673:6f33 with SMTP id cn13-20020a0564020cad00b0045976736f33mr3075010edb.30.1668106910339;
        Thu, 10 Nov 2022 11:01:50 -0800 (PST)
X-Google-Smtp-Source: AMsMyM4ELyX0ibveOBiKPokuTE+EJCn8+vD6jhyyZ+jDrnxzU0BKaidPPPiEM0kckxQPSqQbV5smyQ==
X-Received: by 2002:a05:6402:cad:b0:459:7673:6f33 with SMTP id cn13-20020a0564020cad00b0045976736f33mr3074969edb.30.1668106909891;
        Thu, 10 Nov 2022 11:01:49 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id z6-20020aa7c646000000b0045d74aa401fsm155061edr.60.2022.11.10.11.01.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Nov 2022 11:01:48 -0800 (PST)
Content-Type: multipart/mixed; boundary="------------CIghPnbKIyhFTcHld3TVpFpE"
Message-ID: <38306ffe-12f7-6e48-3d1e-0b30cbb77b84@redhat.com>
Date:   Thu, 10 Nov 2022 20:01:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: ideapad-laptop touchpad handling problems, request for help
Content-Language: en-US, nl
To:     =?UTF-8?Q?Eray_Or=c3=a7unus?= <erayorcunus@gmail.com>
Cc:     cleverline1mc@gmail.com, g_goessel@outlook.com,
        ike.pan@canonical.com, jiaxun.yang@flygoat.com,
        limanyi@uniontech.com, maxtram95@gmail.com, mjg59@srcf.ucam.org,
        platform-driver-x86@vger.kernel.org
References: <bc1202d1-d85d-4173-5979-237bb1ee9254@redhat.com>
 <CAKErNvqfH-C7xJU3F7ga68o3AK-_ae-K2ggKcUOp1iqtmdSYdw@mail.gmail.com>
 <20221110120022.35041-1-erayorcunus@gmail.com>
 <4bcf4e6b-ae2f-0e22-a291-7faa6731e6c7@redhat.com>
 <20221110164220.46640-1-erayorcunus@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20221110164220.46640-1-erayorcunus@gmail.com>
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

This is a multi-part message in MIME format.
--------------CIghPnbKIyhFTcHld3TVpFpE
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 11/10/22 17:42, Eray Orçunus wrote:
> Hi Hans,
> 
> On 10 Nov 2022 at 15:37, Hans de Goede <hdegoede@redhat.com> wrote:
>> On 11/10/22 13:00, Eray Orçunus wrote:
>>> While I agree with your findings(and thanks for your effort, I also tried
>>> to solve this but later gave up), they doesn't apply to one type of
>>> IdeaPads (like my 520-15IKB), so I'm sure this patch won't work on me.
>>> This is because my IdeaPad has this features:
>>>
>>> - i8042.noaux doesn't affect touchpad, and it's connected over i2c
>>> - There is no touchpad LED, and touchpad hotkey only sends "key pressed"
>>>   ACPI event, doesn't do anything else
>>> - VPCCMD_W_TOUCHPAD does nothing (also confirmed on Windows)
>>> - Sending 1 to VPCCMD_W_TOUCHPAD on boot is not needed
>>> - VPCCMD_R_TOUCHPAD always returns 1 (this is interesting)
>>
>> So if i8042.noaux does not do anything, then why do you want to add
>> "SYNA2B33" to the list of ACPI HIDs for which we set:
>>
>> features.touchpad_ctrl_via_ec=0;
>>
>> ?
>>
>> IOW what bad effects / behavior are you seeing with touchpad_ctrl_via_ec=1?
>>
>> Or are you seeing bad behavior on some other modes? If yes, then what
>> is the bad behavior you are seeing on other models ?
> 
> It was just because I didn't want to have a not working "touchpad"
> attribute :) I used/still using several GNOME extensions and they show
> me "Touchpad" toggle just because I have "touchpad" attribute exposed
> there, which is doing nothing, and misleading.

So you are using a gnome-shell extension specifically for ideapads,
which actually uses the sysfs attributes registered by the ideapad-laptop
driver?

I did not expect that. My plan is to pretty much not care about if
the touchpad sysfs attribute works and just document that it may
not work on newer ideapad models.

I believe that the best fix for the ideapad specific extension
might be to just file a bug against the extension and ask it
to remove the touchpad on/off support.

gnome already has a prefectly working touchpad on/off toggle
on the normal control-panel so it is not like removing the
ideapad specific one will cause any loss of functionality.

> But I would understand if you don't want to touch it at that stage, and
> you would rather prefer not working "touchpad" attributes to not
> exposed "touchpad" attributes that would have been perfectly working.

>> I'm guessing that this part:
>>
>>                 unsigned char param;
>>                 /*
>>                  * Some IdeaPads don't really turn off touchpad - they only
>>                  * switch the LED state. We (de)activate KBC AUX port to turn
>>                  * touchpad off and on. We send KEY_TOUCHPAD_OFF and
>>                  * KEY_TOUCHPAD_ON to not to get out of sync with LED
>>                  */
>>                 i8042_command(&param, value ? I8042_CMD_AUX_ENABLE : I8042_CMD_AUX_DISABLE);
>>
>> May cause issues on some models. It definitely feels fishy and
>> I would like to disable this except on models where:
>>
>> 1. There is a LED controlled by some touchpad on/off hotkey; and
>> 2. The EC fails to disable the touchpad itself
>>
>> Which would currently mean only enable this bit on Maxim's Z570
>> using a DMI based allow list.
> 
> Agreed, but do you mean "and" or "or"? I mean we can also include the
> models that toggle touchpad value while not really toggling the touchpad
> (just as you described below) and don't have a touchpad LED (but I don't
> know if such model exists really), this way they won't go out of sync
> regardless of is there a touchpad LED or not.

I meant "and" since I was talking about the Z570.

But you are right that if there are other models which do toggle
the value returned when reading from VPCCMD_R_TOUCHPAD, but don't
actually turn the touchpad on/off, that those then will also need
ideapad-laptop to control the ps2 aux port.


>> At least on Maxim's Z570 the laptop does toggle the value
>> returned by VPCCMD_R_TOUCHPAD and the LED it self, while at the
>> same time not actually disabling the touchpad.
>> The problem is this all relies on being able to detect i2c vs ps/2
>> touchpads which is not as simple as it sounds. Specifically many
>> new touchpad are connected to both busses at the same time, offering
>> a ps/2 mode by default for compatibility with older software / os-es
>> and being able to switch to a modern i2c/smbus mode for better performance.
>>
>> I've asked Benjamin Tissoires, the kernel expert on this about this
>> and his answer was that it is almost impossible to determine if
>> a touchpad is going to be using ps/2 or i2c without first waiting
>> for the whole driver stack to have initialized and then see which
>> driver(s) are attached and I guess even then the touchpad might
>> show up as both ps/2 + i2c with only one of them actually generating
>> events:
>>
>> https://lore.kernel.org/linux-input/ae50236e-1ce8-b526-9c17-7bc0463ebb86@redhat.com/T/#u
>>
>> So based on Benjamin's answer I'm afraid that trying to differentiate
>> between i2c vs ps2 is not really doable.
> 
> Thanks for the explanation and the link, but as Benjamin said, I believe
> we can use ACPI table for detecting PS/2 devices. I believe the DSDTs
> with PS2M(and probably MSS[0-9] too) devices probably have PS/2 touchpad,
> and have working EC and i8042 commands. Yet this still needs
> confirmation/testing, and I think should be resorted if your suggestion
> below won't work - your suggestion looks better and easier.

I don't think there are any guarantees that models with touchpads
which support both ps2 + i2c mode won't have the PS2M or MSS[0-9]
devices, especially since the ps2 support is there to e.g. have
a working mouse in the Windows installer before a touchpad specific
i2c driver is loaded / available.  And the windows installer likely
needs the ACPI ps/2 devices to detect the touchpad ...


>> 1: Fixing undesirable i8042_command(... I8042_CMD_AUX_DISABLE) calls
>> --------------------------------------------------------------------
>>
>> My suggestion is to move to an allow-list for this and for now
>> populate that list with only the DMI strings for Maxim's Z570 and see
>> from there.
> 
> Agreed.
> 
>>
>> 2: Fixing wrong/spurious KEY_TOUCHPAD_OFF / KEY_TOUCHPAD_ON events
>> ------------------------------------------------------------------
>>
>> There are 2 subcases here:
>>
>> 2.1: Fix sending of KEY_TOUCHPAD_OFF/_ON events at probe/resume
>> ---------------------------------------------------------------
>>
>> We can simply fix this by giving ideapad_sync_touchpad_state()
>> a parameter to let it know if events should be send at all and
>> set that parameter to false when called on probe/resume
> 
> Agreed.
> 
>> 2.2: Sending wrong KEY_TOUCHPAD_OFF/_ON events at toggle time
>> -------------------------------------------------------------
>>
>> On models where the EC does not control the touchpad at all,
>> currently we still do ideapad_sync_touchpad_state() and then
>> send either KEY_TOUCHPAD_OFF or _ON based on the value read
>> from VPCCMD_R_TOUCHPAD.
>>
>> But on these models VPCCMD_R_TOUCHPAD always returns 0 or 1,
>> so we always send KEY_TOUCHPAD_OFF or always send KEY_TOUCHPAD_ON,
>> instead of toggling the state / asking userspace to toggle
>> its sw touchpad on/off state.
>>
>> I believe we can detect this case by checking that
>> the value read from VPCCMD_R_TOUCHPAD has not changed
>> despite us receiving a notify with bit 5 being set in
>> the value read from VPCCMD_R_VPC1.
>>
>> My suggestion to fix this case is to detect when the value
>> read from VPCCMD_R_TOUCHPAD does not change and in that
>> case send KEY_TOUCHPAD_TOGGLE to userspace.
> 
> While this is an awesome idea, what about doing this at boot?
> Like we will send 0 first, then check if it reads 0, then send 1,
> and confirm if it reads 1. This would be the ultimate solution, and
> would also fix my "cosmetic" concerns :)

Ok, I've attached a patch series implementing this, please let me
know what you think; and if possible please test this.

Regards,

Hans



--------------CIghPnbKIyhFTcHld3TVpFpE
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-platform-x86-ideapad-laptop-Revert-check-for-touchpa.patch"
Content-Disposition: attachment;
 filename*0="0001-platform-x86-ideapad-laptop-Revert-check-for-touchpa.pa";
 filename*1="tch"
Content-Transfer-Encoding: base64

RnJvbSA0N2YwM2Q4ZDkzZTNiMTMxOWY2NDc3MzU3NzU1MTQ3Y2I3ZmY0NWI5IE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiA9P1VURi04P3E/RXJheT0yME9yPUMzPUE3dW51cz89
IDxlcmF5b3JjdW51c0BnbWFpbC5jb20+CkRhdGU6IFNhdCwgMjkgT2N0IDIwMjIgMTU6MDM6
MDYgKzAzMDAKU3ViamVjdDogW1BBVENIIDEvNF0gcGxhdGZvcm0veDg2OiBpZGVhcGFkLWxh
cHRvcDogUmV2ZXJ0ICJjaGVjayBmb3IgdG91Y2hwYWQKIHN1cHBvcnQgaW4gX0NGRyIKTUlN
RS1WZXJzaW9uOiAxLjAKQ29udGVudC1UeXBlOiB0ZXh0L3BsYWluOyBjaGFyc2V0PVVURi04
CkNvbnRlbnQtVHJhbnNmZXItRW5jb2Rpbmc6IDhiaXQKCkxhc3QgOCBiaXQgb2YgX0NGRyBz
dGFydGVkIGJlaW5nIHVzZWQgaW4gbGF0ZXIgSWRlYVBhZHMsIHRodXMgMzB0aCBiaXQKZG9l
c24ndCBhbHdheXMgc2hvdyB3aGV0aGVyIGRldmljZSBzdXBwb3J0cyB0b3VjaHBhZCBvciB0
b3VjaHBhZCBzd2l0Y2guClJlbW92ZSBjaGVja2luZyBiaXQgMzAgb2YgX0NGRywgc28gb2xk
ZXIgSWRlYVBhZHMgbGlrZSBTMTAtMyBjYW4gc3dpdGNoCnRvdWNocGFkIGFnYWluIHZpYSB0
b3VjaHBhZCBhdHRyaWJ1dGUuCgpUaGlzIHJldmVydHMgY29tbWl0IGIzZWQxYjdmZTM3OCAo
InBsYXRmb3JtL3g4NjogaWRlYXBhZC1sYXB0b3A6IGNoZWNrIGZvcgp0b3VjaHBhZCBzdXBw
b3J0IGluIF9DRkciKS4KClNpZ25lZC1vZmYtYnk6IEVyYXkgT3LDp3VudXMgPGVyYXlvcmN1
bnVzQGdtYWlsLmNvbT4KTGluazogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDIyMTAy
OTEyMDMxMS4xMTE1Mi0yLWVyYXlvcmN1bnVzQGdtYWlsLmNvbQpSZXZpZXdlZC1ieTogSGFu
cyBkZSBHb2VkZSA8aGRlZ29lZGVAcmVkaGF0LmNvbT4KU2lnbmVkLW9mZi1ieTogSGFucyBk
ZSBHb2VkZSA8aGRlZ29lZGVAcmVkaGF0LmNvbT4KLS0tCiBkcml2ZXJzL3BsYXRmb3JtL3g4
Ni9pZGVhcGFkLWxhcHRvcC5jIHwgMTQgKysrKystLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2Vk
LCA1IGluc2VydGlvbnMoKyksIDkgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9wbGF0Zm9ybS94ODYvaWRlYXBhZC1sYXB0b3AuYyBiL2RyaXZlcnMvcGxhdGZvcm0veDg2
L2lkZWFwYWQtbGFwdG9wLmMKaW5kZXggMzNiM2RmZGQxYjA4Li44NzBjNmY0YzQyNDUgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvcGxhdGZvcm0veDg2L2lkZWFwYWQtbGFwdG9wLmMKKysrIGIv
ZHJpdmVycy9wbGF0Zm9ybS94ODYvaWRlYXBhZC1sYXB0b3AuYwpAQCAtNDYsMTEgKzQ2LDEw
IEBAIHN0YXRpYyBjb25zdCBjaGFyICpjb25zdCBpZGVhcGFkX3dtaV9mbmVzY19ldmVudHNb
XSA9IHsKICNlbmRpZgogCiBlbnVtIHsKLQlDRkdfQ0FQX0JUX0JJVCAgICAgICA9IDE2LAot
CUNGR19DQVBfM0dfQklUICAgICAgID0gMTcsCi0JQ0ZHX0NBUF9XSUZJX0JJVCAgICAgPSAx
OCwKLQlDRkdfQ0FQX0NBTV9CSVQgICAgICA9IDE5LAotCUNGR19DQVBfVE9VQ0hQQURfQklU
ID0gMzAsCisJQ0ZHX0NBUF9CVF9CSVQgICA9IDE2LAorCUNGR19DQVBfM0dfQklUICAgPSAx
NywKKwlDRkdfQ0FQX1dJRklfQklUID0gMTgsCisJQ0ZHX0NBUF9DQU1fQklUICA9IDE5LAog
fTsKIAogZW51bSB7CkBAIC0zNzEsOCArMzcwLDYgQEAgc3RhdGljIGludCBkZWJ1Z2ZzX2Nm
Z19zaG93KHN0cnVjdCBzZXFfZmlsZSAqcywgdm9pZCAqZGF0YSkKIAkJc2VxX3B1dHMocywg
IiB3aWZpIik7CiAJaWYgKHRlc3RfYml0KENGR19DQVBfQ0FNX0JJVCwgJnByaXYtPmNmZykp
CiAJCXNlcV9wdXRzKHMsICIgY2FtZXJhIik7Ci0JaWYgKHRlc3RfYml0KENGR19DQVBfVE9V
Q0hQQURfQklULCAmcHJpdi0+Y2ZnKSkKLQkJc2VxX3B1dHMocywgIiB0b3VjaHBhZCIpOwog
CXNlcV9wdXRzKHMsICJcbiIpOwogCiAJc2VxX3B1dHMocywgIkdyYXBoaWNzOiAiKTsKQEAg
LTY2NSw4ICs2NjIsNyBAQCBzdGF0aWMgdW1vZGVfdCBpZGVhcGFkX2lzX3Zpc2libGUoc3Ry
dWN0IGtvYmplY3QgKmtvYmosCiAJZWxzZSBpZiAoYXR0ciA9PSAmZGV2X2F0dHJfZm5fbG9j
ay5hdHRyKQogCQlzdXBwb3J0ZWQgPSBwcml2LT5mZWF0dXJlcy5mbl9sb2NrOwogCWVsc2Ug
aWYgKGF0dHIgPT0gJmRldl9hdHRyX3RvdWNocGFkLmF0dHIpCi0JCXN1cHBvcnRlZCA9IHBy
aXYtPmZlYXR1cmVzLnRvdWNocGFkX2N0cmxfdmlhX2VjICYmCi0JCQkgICAgdGVzdF9iaXQo
Q0ZHX0NBUF9UT1VDSFBBRF9CSVQsICZwcml2LT5jZmcpOworCQlzdXBwb3J0ZWQgPSBwcml2
LT5mZWF0dXJlcy50b3VjaHBhZF9jdHJsX3ZpYV9lYzsKIAllbHNlIGlmIChhdHRyID09ICZk
ZXZfYXR0cl91c2JfY2hhcmdpbmcuYXR0cikKIAkJc3VwcG9ydGVkID0gcHJpdi0+ZmVhdHVy
ZXMudXNiX2NoYXJnaW5nOwogCi0tIAoyLjM3LjMKCg==
--------------CIghPnbKIyhFTcHld3TVpFpE
Content-Type: text/x-patch; charset=UTF-8;
 name="0002-platform-x86-ideapad-laptop-Refactor-ideapad_sync_to.patch"
Content-Disposition: attachment;
 filename*0="0002-platform-x86-ideapad-laptop-Refactor-ideapad_sync_to.pa";
 filename*1="tch"
Content-Transfer-Encoding: base64

RnJvbSBjYjhiMzExNzE5M2ZmYTg5YTliYTE5NzE2NDBmMzdmMDMyYTZmMmVkIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBIYW5zIGRlIEdvZWRlIDxoZGVnb2VkZUByZWRoYXQu
Y29tPgpEYXRlOiBUaHUsIDEwIE5vdiAyMDIyIDE3OjAwOjAwICswMTAwClN1YmplY3Q6IFtQ
QVRDSCAyLzRdIHBsYXRmb3JtL3g4NjogaWRlYXBhZC1sYXB0b3A6IFJlZmFjdG9yCiBpZGVh
cGFkX3N5bmNfdG91Y2hwYWRfc3RhdGUoKQoKQWRkIGFuIGVycm9yIGV4aXQgZm9yIHJlYWRf
ZWNfZGF0YSgpIGZhaWxpbmcgaW5zdGVhZCBvZiBwdXR0aW5nIHRoZSBtYWluCmJvZHkgaW4g
YW4gaWYgKHN1Y2Nlc3MpIGJsb2NrLgoKU2lnbmVkLW9mZi1ieTogSGFucyBkZSBHb2VkZSA8
aGRlZ29lZGVAcmVkaGF0LmNvbT4KLS0tCiBkcml2ZXJzL3BsYXRmb3JtL3g4Ni9pZGVhcGFk
LWxhcHRvcC5jIHwgMjcgKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hh
bmdlZCwgMTUgaW5zZXJ0aW9ucygrKSwgMTIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9wbGF0Zm9ybS94ODYvaWRlYXBhZC1sYXB0b3AuYyBiL2RyaXZlcnMvcGxhdGZv
cm0veDg2L2lkZWFwYWQtbGFwdG9wLmMKaW5kZXggODcwYzZmNGM0MjQ1Li43YWI2MzgwNjlk
ZjkgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvcGxhdGZvcm0veDg2L2lkZWFwYWQtbGFwdG9wLmMK
KysrIGIvZHJpdmVycy9wbGF0Zm9ybS94ODYvaWRlYXBhZC1sYXB0b3AuYwpAQCAtMTM5OCwy
MyArMTM5OCwyNiBAQCBzdGF0aWMgdm9pZCBpZGVhcGFkX2tiZF9ibF9leGl0KHN0cnVjdCBp
ZGVhcGFkX3ByaXZhdGUgKnByaXYpCiBzdGF0aWMgdm9pZCBpZGVhcGFkX3N5bmNfdG91Y2hw
YWRfc3RhdGUoc3RydWN0IGlkZWFwYWRfcHJpdmF0ZSAqcHJpdikKIHsKIAl1bnNpZ25lZCBs
b25nIHZhbHVlOworCXVuc2lnbmVkIGNoYXIgcGFyYW07CisJaW50IHJldDsKIAogCWlmICgh
cHJpdi0+ZmVhdHVyZXMudG91Y2hwYWRfY3RybF92aWFfZWMpCiAJCXJldHVybjsKIAogCS8q
IFdpdGhvdXQgcmVhZGluZyBmcm9tIEVDIHRvdWNocGFkIExFRCBkb2Vzbid0IHN3aXRjaCBz
dGF0ZSAqLwotCWlmICghcmVhZF9lY19kYXRhKHByaXYtPmFkZXYtPmhhbmRsZSwgVlBDQ01E
X1JfVE9VQ0hQQUQsICZ2YWx1ZSkpIHsKLQkJdW5zaWduZWQgY2hhciBwYXJhbTsKLQkJLyoK
LQkJICogU29tZSBJZGVhUGFkcyBkb24ndCByZWFsbHkgdHVybiBvZmYgdG91Y2hwYWQgLSB0
aGV5IG9ubHkKLQkJICogc3dpdGNoIHRoZSBMRUQgc3RhdGUuIFdlIChkZSlhY3RpdmF0ZSBL
QkMgQVVYIHBvcnQgdG8gdHVybgotCQkgKiB0b3VjaHBhZCBvZmYgYW5kIG9uLiBXZSBzZW5k
IEtFWV9UT1VDSFBBRF9PRkYgYW5kCi0JCSAqIEtFWV9UT1VDSFBBRF9PTiB0byBub3QgdG8g
Z2V0IG91dCBvZiBzeW5jIHdpdGggTEVECi0JCSAqLwotCQlpODA0Ml9jb21tYW5kKCZwYXJh
bSwgdmFsdWUgPyBJODA0Ml9DTURfQVVYX0VOQUJMRSA6IEk4MDQyX0NNRF9BVVhfRElTQUJM
RSk7Ci0JCWlkZWFwYWRfaW5wdXRfcmVwb3J0KHByaXYsIHZhbHVlID8gNjcgOiA2Nik7Ci0J
CXN5c2ZzX25vdGlmeSgmcHJpdi0+cGxhdGZvcm1fZGV2aWNlLT5kZXYua29iaiwgTlVMTCwg
InRvdWNocGFkIik7Ci0JfQorCXJldCA9IHJlYWRfZWNfZGF0YShwcml2LT5hZGV2LT5oYW5k
bGUsIFZQQ0NNRF9SX1RPVUNIUEFELCAmdmFsdWUpOworCWlmIChyZXQpCisJCXJldHVybjsK
KworCS8qCisJICogU29tZSBJZGVhUGFkcyBkb24ndCByZWFsbHkgdHVybiBvZmYgdG91Y2hw
YWQgLSB0aGV5IG9ubHkKKwkgKiBzd2l0Y2ggdGhlIExFRCBzdGF0ZS4gV2UgKGRlKWFjdGl2
YXRlIEtCQyBBVVggcG9ydCB0byB0dXJuCisJICogdG91Y2hwYWQgb2ZmIGFuZCBvbi4gV2Ug
c2VuZCBLRVlfVE9VQ0hQQURfT0ZGIGFuZAorCSAqIEtFWV9UT1VDSFBBRF9PTiB0byBub3Qg
dG8gZ2V0IG91dCBvZiBzeW5jIHdpdGggTEVECisJICovCisJaTgwNDJfY29tbWFuZCgmcGFy
YW0sIHZhbHVlID8gSTgwNDJfQ01EX0FVWF9FTkFCTEUgOiBJODA0Ml9DTURfQVVYX0RJU0FC
TEUpOworCWlkZWFwYWRfaW5wdXRfcmVwb3J0KHByaXYsIHZhbHVlID8gNjcgOiA2Nik7CisJ
c3lzZnNfbm90aWZ5KCZwcml2LT5wbGF0Zm9ybV9kZXZpY2UtPmRldi5rb2JqLCBOVUxMLCAi
dG91Y2hwYWQiKTsKIH0KIAogc3RhdGljIHZvaWQgaWRlYXBhZF9hY3BpX25vdGlmeShhY3Bp
X2hhbmRsZSBoYW5kbGUsIHUzMiBldmVudCwgdm9pZCAqZGF0YSkKLS0gCjIuMzcuMwoK
--------------CIghPnbKIyhFTcHld3TVpFpE
Content-Type: text/x-patch; charset=UTF-8;
 name="0003-platform-x86-ideapad-laptop-Do-not-send-KEY_TOUCHPAD.patch"
Content-Disposition: attachment;
 filename*0="0003-platform-x86-ideapad-laptop-Do-not-send-KEY_TOUCHPAD.pa";
 filename*1="tch"
Content-Transfer-Encoding: base64

RnJvbSA5MzEwM2ZmODVjZTgzZjRhMjE5NzNlZTI2YmE1MDMxOWY1ZjgyMzZiIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBIYW5zIGRlIEdvZWRlIDxoZGVnb2VkZUByZWRoYXQu
Y29tPgpEYXRlOiBUaHUsIDEwIE5vdiAyMDIyIDE3OjAzOjQ2ICswMTAwClN1YmplY3Q6IFtQ
QVRDSCAzLzRdIHBsYXRmb3JtL3g4NjogaWRlYXBhZC1sYXB0b3A6IERvIG5vdCBzZW5kIEtF
WV9UT1VDSFBBRCoKIGV2ZW50cyBvbiBwcm9iZSAvIHJlc3VtZQoKVGhlIHNlbmRpbmcgb2Yg
S0VZX1RPVUNIUEFEKiBldmVudHMgaXMgY2F1c2luZyBzcHVyaW91cyB0b3VjaHBhZCBPU0QK
c2hvd2luZyBvbiByZXN1bWUuCgpEaXNhYmxlIHRoZSBzZW5kaW5nIG9mIGV2ZW50cyBvbiBw
cm9iZSAvIHJlc3VtZSB0byBmaXggdGhpcy4KClNpZ25lZC1vZmYtYnk6IEhhbnMgZGUgR29l
ZGUgPGhkZWdvZWRlQHJlZGhhdC5jb20+Ci0tLQogZHJpdmVycy9wbGF0Zm9ybS94ODYvaWRl
YXBhZC1sYXB0b3AuYyB8IDE1ICsrKysrKysrKy0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDkg
aW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3Bs
YXRmb3JtL3g4Ni9pZGVhcGFkLWxhcHRvcC5jIGIvZHJpdmVycy9wbGF0Zm9ybS94ODYvaWRl
YXBhZC1sYXB0b3AuYwppbmRleCA3YWI2MzgwNjlkZjkuLjA1MzViYjYwMmVlZSAxMDA2NDQK
LS0tIGEvZHJpdmVycy9wbGF0Zm9ybS94ODYvaWRlYXBhZC1sYXB0b3AuYworKysgYi9kcml2
ZXJzL3BsYXRmb3JtL3g4Ni9pZGVhcGFkLWxhcHRvcC5jCkBAIC0xMzk1LDcgKzEzOTUsNyBA
QCBzdGF0aWMgdm9pZCBpZGVhcGFkX2tiZF9ibF9leGl0KHN0cnVjdCBpZGVhcGFkX3ByaXZh
dGUgKnByaXYpCiAvKgogICogbW9kdWxlIGluaXQvZXhpdAogICovCi1zdGF0aWMgdm9pZCBp
ZGVhcGFkX3N5bmNfdG91Y2hwYWRfc3RhdGUoc3RydWN0IGlkZWFwYWRfcHJpdmF0ZSAqcHJp
dikKK3N0YXRpYyB2b2lkIGlkZWFwYWRfc3luY190b3VjaHBhZF9zdGF0ZShzdHJ1Y3QgaWRl
YXBhZF9wcml2YXRlICpwcml2LCBib29sIHNlbmRfZXZlbnRzKQogewogCXVuc2lnbmVkIGxv
bmcgdmFsdWU7CiAJdW5zaWduZWQgY2hhciBwYXJhbTsKQEAgLTE0MTYsOCArMTQxNiwxMSBA
QCBzdGF0aWMgdm9pZCBpZGVhcGFkX3N5bmNfdG91Y2hwYWRfc3RhdGUoc3RydWN0IGlkZWFw
YWRfcHJpdmF0ZSAqcHJpdikKIAkgKiBLRVlfVE9VQ0hQQURfT04gdG8gbm90IHRvIGdldCBv
dXQgb2Ygc3luYyB3aXRoIExFRAogCSAqLwogCWk4MDQyX2NvbW1hbmQoJnBhcmFtLCB2YWx1
ZSA/IEk4MDQyX0NNRF9BVVhfRU5BQkxFIDogSTgwNDJfQ01EX0FVWF9ESVNBQkxFKTsKLQlp
ZGVhcGFkX2lucHV0X3JlcG9ydChwcml2LCB2YWx1ZSA/IDY3IDogNjYpOwotCXN5c2ZzX25v
dGlmeSgmcHJpdi0+cGxhdGZvcm1fZGV2aWNlLT5kZXYua29iaiwgTlVMTCwgInRvdWNocGFk
Iik7CisKKwlpZiAoc2VuZF9ldmVudHMpIHsKKwkJaWRlYXBhZF9pbnB1dF9yZXBvcnQocHJp
diwgdmFsdWUgPyA2NyA6IDY2KTsKKwkJc3lzZnNfbm90aWZ5KCZwcml2LT5wbGF0Zm9ybV9k
ZXZpY2UtPmRldi5rb2JqLCBOVUxMLCAidG91Y2hwYWQiKTsKKwl9CiB9CiAKIHN0YXRpYyB2
b2lkIGlkZWFwYWRfYWNwaV9ub3RpZnkoYWNwaV9oYW5kbGUgaGFuZGxlLCB1MzIgZXZlbnQs
IHZvaWQgKmRhdGEpCkBAIC0xNDU4LDcgKzE0NjEsNyBAQCBzdGF0aWMgdm9pZCBpZGVhcGFk
X2FjcGlfbm90aWZ5KGFjcGlfaGFuZGxlIGhhbmRsZSwgdTMyIGV2ZW50LCB2b2lkICpkYXRh
KQogCQkJaWRlYXBhZF9zeW5jX3Jma19zdGF0ZShwcml2KTsKIAkJCWJyZWFrOwogCQljYXNl
IDU6Ci0JCQlpZGVhcGFkX3N5bmNfdG91Y2hwYWRfc3RhdGUocHJpdik7CisJCQlpZGVhcGFk
X3N5bmNfdG91Y2hwYWRfc3RhdGUocHJpdiwgdHJ1ZSk7CiAJCQlicmVhazsKIAkJY2FzZSA0
OgogCQkJaWRlYXBhZF9iYWNrbGlnaHRfbm90aWZ5X2JyaWdodG5lc3MocHJpdik7CkBAIC0x
NjQ1LDcgKzE2NDgsNyBAQCBzdGF0aWMgaW50IGlkZWFwYWRfYWNwaV9hZGQoc3RydWN0IHBs
YXRmb3JtX2RldmljZSAqcGRldikKIAkJCWlkZWFwYWRfcmVnaXN0ZXJfcmZraWxsKHByaXYs
IGkpOwogCiAJaWRlYXBhZF9zeW5jX3Jma19zdGF0ZShwcml2KTsKLQlpZGVhcGFkX3N5bmNf
dG91Y2hwYWRfc3RhdGUocHJpdik7CisJaWRlYXBhZF9zeW5jX3RvdWNocGFkX3N0YXRlKHBy
aXYsIGZhbHNlKTsKIAogCWVyciA9IGlkZWFwYWRfZHl0Y19wcm9maWxlX2luaXQocHJpdik7
CiAJaWYgKGVycikgewpAQCAtMTc0Nyw3ICsxNzUwLDcgQEAgc3RhdGljIGludCBpZGVhcGFk
X2FjcGlfcmVzdW1lKHN0cnVjdCBkZXZpY2UgKmRldikKIAlzdHJ1Y3QgaWRlYXBhZF9wcml2
YXRlICpwcml2ID0gZGV2X2dldF9kcnZkYXRhKGRldik7CiAKIAlpZGVhcGFkX3N5bmNfcmZr
X3N0YXRlKHByaXYpOwotCWlkZWFwYWRfc3luY190b3VjaHBhZF9zdGF0ZShwcml2KTsKKwlp
ZGVhcGFkX3N5bmNfdG91Y2hwYWRfc3RhdGUocHJpdiwgZmFsc2UpOwogCiAJaWYgKHByaXYt
PmR5dGMpCiAJCWR5dGNfcHJvZmlsZV9yZWZyZXNoKHByaXYpOwotLSAKMi4zNy4zCgo=
--------------CIghPnbKIyhFTcHld3TVpFpE
Content-Type: text/x-patch; charset=UTF-8;
 name="0004-platform-x86-ideapad-laptop-Rework-touchpad-control-.patch"
Content-Disposition: attachment;
 filename*0="0004-platform-x86-ideapad-laptop-Rework-touchpad-control-.pa";
 filename*1="tch"
Content-Transfer-Encoding: base64

RnJvbSBiNDgzM2Y1MzA4YTBlOTBhZmMwZWY0YTZlYzU3YjgwNGE4OWM0YTg3IE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBIYW5zIGRlIEdvZWRlIDxoZGVnb2VkZUByZWRoYXQu
Y29tPgpEYXRlOiBUaHUsIDEwIE5vdiAyMDIyIDE5OjM3OjI2ICswMTAwClN1YmplY3Q6IFtQ
QVRDSCA0LzRdIHBsYXRmb3JtL3g4NjogaWRlYXBhZC1sYXB0b3A6IFJld29yayB0b3VjaHBh
ZCBjb250cm9sCiBjb2RlCk1JTUUtVmVyc2lvbjogMS4wCkNvbnRlbnQtVHlwZTogdGV4dC9w
bGFpbjsgY2hhcnNldD1VVEYtOApDb250ZW50LVRyYW5zZmVyLUVuY29kaW5nOiA4Yml0CgpS
ZWNlbnRseSB0aGVyZSBoYXZlIGJlZW4gbXVsdGlwbGUgcGF0Y2hlcyB0byBkaXNhYmxlIHRo
ZSBpZGVhcGFkLWxhcHRvcCdzCnRvdWNocGFkIGNvbnRyb2wgY29kZSwgYmVjYXVzZSBpdCBp
cyBjYXVzaW5nIGlzc3VlcyBvbiB2YXJpb3VzIGxhcHRvcHMsCnNlZSB0aGUgRml4ZXMgdGFn
cyBmb3IgdGhpcyBjb21taXQuCgpUaGUgdHVybmluZyBvbi9vZmYgb2YgdGhlIHBzMiBhdXgg
cG9ydCB3YXMgYWRkZWQgc3BlY2lmaWNhbGx5IGZvcgp0aGUgSWRlYVBhZCBaNTcwLCB3aGVy
ZSB0aGUgRUMgZG9lcyB0b2dnbGUgdGhlIHRvdWNocGFkIG9uL29mZiBMRUQgYW5kCnRvZ2ds
ZXMgdGhlIHZhbHVlIHJldHVybmVkIGJ5IHJlYWRpbmcgVlBDQ01EX1JfVE9VQ0hQQUQsIGJ1
dCBpdCBkb2VzIG5vdAphY3R1YWxseSB0dXJuIG9uL29mZiB0aGUgdG91Y2hwYWQuCgpUaGUg
aWRlYXBhZC1sYXB0b3AgY29kZSByZWFsbHkgc2hvdWxkIG5vdCBiZSBtZXNzaW5nIHdpdGgg
dGhlIGk4MDQyCmNvbnRyb2xsZXIgb24gYWxsIGRldmljZXMganVzdCBmb3IgdGhpcyBzcGVj
aWFsIGNhc2UuCgpEcm9wIHRoZSB0b3VjaHBhZF9jdHJsX3ZpYV9lYyBmbGFnIGFuZCBhZGQg
YSBETUkgYmFzZWQgYWxsb3ctbGlzdCBmb3IKZGV2aWNlcyB3aGljaCBuZWVkIHRoaXMgd29y
a2Fyb3VuZCwgcG9wdWxhdGluZyBpdCB3aXRoIGp1c3QgdGhlCklkZWFwYWQgWjU3MCBmb3Ig
bm93LgoKQSByZWxhdGVkIHByb2JsZW0gaXMgdGhhdCBvbiByZWNlbnQgSWRlYXBhZCBtb2Rl
bHMgdGhlIEVDIGRvZXMgbm90IGNvbnRyb2wKdGhlIHRvdWNocGFkIGF0IGFsbC4gQ2hlY2sg
Zm9yIHRoaXMgYnkgY2hlY2tpbmcgaWYgdGhlIHZhbHVlIHJlYWQgZnJvbQpWUENDTURfUl9U
T1VDSFBBRCBhY3R1YWxseSBjaGFuZ2VzIHdoZW4gcmVjZWl2aW5nIGEgdG91Y2hwYWQtdG9n
Z2xlIGhvdGtleQpldmVudDsgYW5kIGlmIGl0IGRvZXMgbm90IGNoYW5nZSBzZW5kIEtFWV9U
T1VDSFBBRF9UT0dHTEUgdG8gdXNlcnNwYWNlIHRvCmxldCB1c2Vyc3BhY2UgZW5hYmxlL2Rp
c2FibGUgdGhlIHRvdWNocGFkIGluIHNvZnR3YXJlLgoKRml4ZXM6IGQ2OWNkN2VlYTkzZSAo
InBsYXRmb3JtL3g4NjogaWRlYXBhZC1sYXB0b3A6IERpc2FibGUgdG91Y2hwYWRfc3dpdGNo
IGZvciBFTEFOMDYzNCIpCkZpeGVzOiBhMjMxMjI0YTYwMWMgKCJwbGF0Zm9ybS94ODY6IGlk
ZWFwYWQtbGFwdG9wOiBEaXNhYmxlIHRvdWNocGFkX3N3aXRjaCIpCkNjOiBNYXhpbSBNaWtp
dHlhbnNraXkgPG1heHRyYW05NUBnbWFpbC5jb20+CkNjOiBHT0VTU0VMIEd1aWxsYXVtZSA8
Z19nb2Vzc2VsQG91dGxvb2suY29tPgpDYzogSmlheHVuIFlhbmcgPGppYXh1bi55YW5nQGZs
eWdvYXQuY29tPgpDYzogTWFueWkgTGkgPGxpbWFueWlAdW5pb250ZWNoLmNvbT4KQ2M6IEVy
YXkgT3LDp3VudXMgPGVyYXlvcmN1bnVzQGdtYWlsLmNvbT4KQ2M6IElrZSBQYW5oYyA8aWtl
LnBhbkBjYW5vbmljYWwuY29tPgpTaWduZWQtb2ZmLWJ5OiBIYW5zIGRlIEdvZWRlIDxoZGVn
b2VkZUByZWRoYXQuY29tPgotLS0KIGRyaXZlcnMvcGxhdGZvcm0veDg2L2lkZWFwYWQtbGFw
dG9wLmMgfCA1NiArKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2Vk
LCAyMyBpbnNlcnRpb25zKCspLCAzMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL3BsYXRmb3JtL3g4Ni9pZGVhcGFkLWxhcHRvcC5jIGIvZHJpdmVycy9wbGF0Zm9ybS94
ODYvaWRlYXBhZC1sYXB0b3AuYwppbmRleCAwNTM1YmI2MDJlZWUuLmE1MjllYmMyNmU1ZSAx
MDA2NDQKLS0tIGEvZHJpdmVycy9wbGF0Zm9ybS94ODYvaWRlYXBhZC1sYXB0b3AuYworKysg
Yi9kcml2ZXJzL3BsYXRmb3JtL3g4Ni9pZGVhcGFkLWxhcHRvcC5jCkBAIC0xMjksNiArMTI5
LDcgQEAgc3RydWN0IGlkZWFwYWRfcHJpdmF0ZSB7CiAJc3RydWN0IGlkZWFwYWRfZHl0Y19w
cml2ICpkeXRjOwogCXN0cnVjdCBkZW50cnkgKmRlYnVnOwogCXVuc2lnbmVkIGxvbmcgY2Zn
OworCXVuc2lnbmVkIGxvbmcgcl90b3VjaHBhZF92YWw7CiAJY29uc3QgY2hhciAqZm5lc2Nf
Z3VpZDsKIAlzdHJ1Y3QgewogCQlib29sIGNvbnNlcnZhdGlvbl9tb2RlICAgIDogMTsKQEAg
LTEzNyw4ICsxMzgsOCBAQCBzdHJ1Y3QgaWRlYXBhZF9wcml2YXRlIHsKIAkJYm9vbCBmbl9s
b2NrICAgICAgICAgICAgICA6IDE7CiAJCWJvb2wgaHdfcmZraWxsX3N3aXRjaCAgICAgOiAx
OwogCQlib29sIGtiZF9ibCAgICAgICAgICAgICAgIDogMTsKLQkJYm9vbCB0b3VjaHBhZF9j
dHJsX3ZpYV9lYyA6IDE7CiAJCWJvb2wgdXNiX2NoYXJnaW5nICAgICAgICAgOiAxOworCQli
b29sIGN0cmxfcHMyX2F1eF9wb3J0ICAgIDogMTsKIAl9IGZlYXR1cmVzOwogCXN0cnVjdCB7
CiAJCWJvb2wgaW5pdGlhbGl6ZWQ7CkBAIC02NjEsOCArNjYyLDYgQEAgc3RhdGljIHVtb2Rl
X3QgaWRlYXBhZF9pc192aXNpYmxlKHN0cnVjdCBrb2JqZWN0ICprb2JqLAogCQlzdXBwb3J0
ZWQgPSBwcml2LT5mZWF0dXJlcy5mYW5fbW9kZTsKIAllbHNlIGlmIChhdHRyID09ICZkZXZf
YXR0cl9mbl9sb2NrLmF0dHIpCiAJCXN1cHBvcnRlZCA9IHByaXYtPmZlYXR1cmVzLmZuX2xv
Y2s7Ci0JZWxzZSBpZiAoYXR0ciA9PSAmZGV2X2F0dHJfdG91Y2hwYWQuYXR0cikKLQkJc3Vw
cG9ydGVkID0gcHJpdi0+ZmVhdHVyZXMudG91Y2hwYWRfY3RybF92aWFfZWM7CiAJZWxzZSBp
ZiAoYXR0ciA9PSAmZGV2X2F0dHJfdXNiX2NoYXJnaW5nLmF0dHIpCiAJCXN1cHBvcnRlZCA9
IHByaXYtPmZlYXR1cmVzLnVzYl9jaGFyZ2luZzsKIApAQCAtMTA4Miw2ICsxMDgxLDcgQEAg
c3RhdGljIGNvbnN0IHN0cnVjdCBrZXlfZW50cnkgaWRlYXBhZF9rZXltYXBbXSA9IHsKIAl7
IEtFX0tFWSwgIDY1LCB7IEtFWV9QUk9HNCB9IH0sCiAJeyBLRV9LRVksICA2NiwgeyBLRVlf
VE9VQ0hQQURfT0ZGIH0gfSwKIAl7IEtFX0tFWSwgIDY3LCB7IEtFWV9UT1VDSFBBRF9PTiB9
IH0sCisJeyBLRV9LRVksICA2OCwgeyBLRVlfVE9VQ0hQQURfVE9HR0xFIH0gfSwKIAl7IEtF
X0tFWSwgMTI4LCB7IEtFWV9FU0MgfSB9LAogCXsgS0VfRU5EIH0sCiB9OwpAQCAtMTQwMSw5
ICsxNDAxLDYgQEAgc3RhdGljIHZvaWQgaWRlYXBhZF9zeW5jX3RvdWNocGFkX3N0YXRlKHN0
cnVjdCBpZGVhcGFkX3ByaXZhdGUgKnByaXYsIGJvb2wgc2VuZF8KIAl1bnNpZ25lZCBjaGFy
IHBhcmFtOwogCWludCByZXQ7CiAKLQlpZiAoIXByaXYtPmZlYXR1cmVzLnRvdWNocGFkX2N0
cmxfdmlhX2VjKQotCQlyZXR1cm47Ci0KIAkvKiBXaXRob3V0IHJlYWRpbmcgZnJvbSBFQyB0
b3VjaHBhZCBMRUQgZG9lc24ndCBzd2l0Y2ggc3RhdGUgKi8KIAlyZXQgPSByZWFkX2VjX2Rh
dGEocHJpdi0+YWRldi0+aGFuZGxlLCBWUENDTURfUl9UT1VDSFBBRCwgJnZhbHVlKTsKIAlp
ZiAocmV0KQpAQCAtMTQxMiwxNSArMTQwOSwyNiBAQCBzdGF0aWMgdm9pZCBpZGVhcGFkX3N5
bmNfdG91Y2hwYWRfc3RhdGUoc3RydWN0IGlkZWFwYWRfcHJpdmF0ZSAqcHJpdiwgYm9vbCBz
ZW5kXwogCS8qCiAJICogU29tZSBJZGVhUGFkcyBkb24ndCByZWFsbHkgdHVybiBvZmYgdG91
Y2hwYWQgLSB0aGV5IG9ubHkKIAkgKiBzd2l0Y2ggdGhlIExFRCBzdGF0ZS4gV2UgKGRlKWFj
dGl2YXRlIEtCQyBBVVggcG9ydCB0byB0dXJuCi0JICogdG91Y2hwYWQgb2ZmIGFuZCBvbi4g
V2Ugc2VuZCBLRVlfVE9VQ0hQQURfT0ZGIGFuZAotCSAqIEtFWV9UT1VDSFBBRF9PTiB0byBu
b3QgdG8gZ2V0IG91dCBvZiBzeW5jIHdpdGggTEVECisJICogdGhlIHRvdWNocGFkIG9uIGFu
ZCBvZmYuCiAJICovCi0JaTgwNDJfY29tbWFuZCgmcGFyYW0sIHZhbHVlID8gSTgwNDJfQ01E
X0FVWF9FTkFCTEUgOiBJODA0Ml9DTURfQVVYX0RJU0FCTEUpOworCWlmIChwcml2LT5mZWF0
dXJlcy5jdHJsX3BzMl9hdXhfcG9ydCkKKwkJaTgwNDJfY29tbWFuZCgmcGFyYW0sIHZhbHVl
ID8gSTgwNDJfQ01EX0FVWF9FTkFCTEUgOiBJODA0Ml9DTURfQVVYX0RJU0FCTEUpOwogCiAJ
aWYgKHNlbmRfZXZlbnRzKSB7Ci0JCWlkZWFwYWRfaW5wdXRfcmVwb3J0KHByaXYsIHZhbHVl
ID8gNjcgOiA2Nik7Ci0JCXN5c2ZzX25vdGlmeSgmcHJpdi0+cGxhdGZvcm1fZGV2aWNlLT5k
ZXYua29iaiwgTlVMTCwgInRvdWNocGFkIik7CisJCS8qCisJCSAqIE9uIG9sZGVyIG1vZGVs
cyB0aGUgRUMgY29udHJvbHMgdGhlIHRvdWNocGFkIGFuZCB0b2dnbGVzIGl0CisJCSAqIG9u
L29mZiBpdHNlbGYsIGluIHRoaXMgY2FzZSB3ZSByZXBvcnQgS0VZX1RPVUNIUEFEX09OL19P
RkYuCisJCSAqIElmIHRoZSBFQyBkaWQgbm90IHRvZ2dsZSwgcmVwb3J0IEtFWV9UT1VDSFBB
RF9UT0dHTEUuCisJCSAqLworCQlpZiAodmFsdWUgIT0gcHJpdi0+cl90b3VjaHBhZF92YWwp
IHsKKwkJCWlkZWFwYWRfaW5wdXRfcmVwb3J0KHByaXYsIHZhbHVlID8gNjcgOiA2Nik7CisJ
CQlzeXNmc19ub3RpZnkoJnByaXYtPnBsYXRmb3JtX2RldmljZS0+ZGV2LmtvYmosIE5VTEws
ICJ0b3VjaHBhZCIpOworCQl9IGVsc2UgeworCQkJaWRlYXBhZF9pbnB1dF9yZXBvcnQocHJp
diwgNjgpOworCQl9CiAJfQorCisJcHJpdi0+cl90b3VjaHBhZF92YWwgPSB2YWx1ZTsKIH0K
IAogc3RhdGljIHZvaWQgaWRlYXBhZF9hY3BpX25vdGlmeShhY3BpX2hhbmRsZSBoYW5kbGUs
IHUzMiBldmVudCwgdm9pZCAqZGF0YSkKQEAgLTE1MzUsMTkgKzE1NDMsMTIgQEAgc3RhdGlj
IGNvbnN0IHN0cnVjdCBkbWlfc3lzdGVtX2lkIGh3X3Jma2lsbF9saXN0W10gPSB7CiAJe30K
IH07CiAKLXN0YXRpYyBjb25zdCBzdHJ1Y3QgZG1pX3N5c3RlbV9pZCBub190b3VjaHBhZF9z
d2l0Y2hfbGlzdFtdID0gewotCXsKLQkuaWRlbnQgPSAiTGVub3ZvIFlvZ2EgMyBQcm8gMTM3
MCIsCi0JLm1hdGNoZXMgPSB7Ci0JCURNSV9NQVRDSChETUlfU1lTX1ZFTkRPUiwgIkxFTk9W
TyIpLAotCQlETUlfTUFUQ0goRE1JX1BST0RVQ1RfVkVSU0lPTiwgIkxlbm92byBZT0dBIDMi
KSwKLQkJfSwKLQl9LAorc3RhdGljIGNvbnN0IHN0cnVjdCBkbWlfc3lzdGVtX2lkIGN0cmxf
cHMyX2F1eF9wb3J0X2xpc3RbXSA9IHsKIAl7Ci0JLmlkZW50ID0gIlpoYW9ZYW5nIEs0ZS1J
TUwiLAorCS8qIExlbm92byBJZGVhcGFkIFo1NzAgKi8KIAkubWF0Y2hlcyA9IHsKIAkJRE1J
X01BVENIKERNSV9TWVNfVkVORE9SLCAiTEVOT1ZPIiksCi0JCURNSV9NQVRDSChETUlfUFJP
RFVDVF9WRVJTSU9OLCAiWmhhb1lhbmcgSzRlLUlNTCIpLAorCQlETUlfTUFUQ0goRE1JX1BS
T0RVQ1RfVkVSU0lPTiwgIklkZWFwYWQgWjU3MCIpLAogCQl9LAogCX0sCiAJe30KQEAgLTE1
NTksMTQgKzE1NjAsNyBAQCBzdGF0aWMgdm9pZCBpZGVhcGFkX2NoZWNrX2ZlYXR1cmVzKHN0
cnVjdCBpZGVhcGFkX3ByaXZhdGUgKnByaXYpCiAJdW5zaWduZWQgbG9uZyB2YWw7CiAKIAlw
cml2LT5mZWF0dXJlcy5od19yZmtpbGxfc3dpdGNoID0gZG1pX2NoZWNrX3N5c3RlbShod19y
ZmtpbGxfbGlzdCk7Ci0KLQkvKiBNb3N0IGlkZWFwYWRzIHdpdGggRUxBTjA2MzQgdG91Y2hw
YWQgZG9uJ3QgdXNlIEVDIHRvdWNocGFkIHN3aXRjaCAqLwotCWlmIChhY3BpX2Rldl9wcmVz
ZW50KCJFTEFOMDYzNCIsIE5VTEwsIC0xKSkKLQkJcHJpdi0+ZmVhdHVyZXMudG91Y2hwYWRf
Y3RybF92aWFfZWMgPSAwOwotCWVsc2UgaWYgKGRtaV9jaGVja19zeXN0ZW0obm9fdG91Y2hw
YWRfc3dpdGNoX2xpc3QpKQotCQlwcml2LT5mZWF0dXJlcy50b3VjaHBhZF9jdHJsX3ZpYV9l
YyA9IDA7Ci0JZWxzZQotCQlwcml2LT5mZWF0dXJlcy50b3VjaHBhZF9jdHJsX3ZpYV9lYyA9
IDE7CisJcHJpdi0+ZmVhdHVyZXMuY3RybF9wczJfYXV4X3BvcnQgPSBkbWlfY2hlY2tfc3lz
dGVtKGN0cmxfcHMyX2F1eF9wb3J0X2xpc3QpOwogCiAJaWYgKCFyZWFkX2VjX2RhdGEoaGFu
ZGxlLCBWUENDTURfUl9GQU4sICZ2YWwpKQogCQlwcml2LT5mZWF0dXJlcy5mYW5fbW9kZSA9
IHRydWU7CkBAIC0xNjM5LDEwICsxNjMzLDYgQEAgc3RhdGljIGludCBpZGVhcGFkX2FjcGlf
YWRkKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAJaWYgKCFwcml2LT5mZWF0dXJl
cy5od19yZmtpbGxfc3dpdGNoKQogCQl3cml0ZV9lY19jbWQocHJpdi0+YWRldi0+aGFuZGxl
LCBWUENDTURfV19SRiwgMSk7CiAKLQkvKiBUaGUgc2FtZSBmb3IgVG91Y2hwYWQgKi8KLQlp
ZiAoIXByaXYtPmZlYXR1cmVzLnRvdWNocGFkX2N0cmxfdmlhX2VjKQotCQl3cml0ZV9lY19j
bWQocHJpdi0+YWRldi0+aGFuZGxlLCBWUENDTURfV19UT1VDSFBBRCwgMSk7Ci0KIAlmb3Ig
KGkgPSAwOyBpIDwgSURFQVBBRF9SRktJTExfREVWX05VTTsgaSsrKQogCQlpZiAodGVzdF9i
aXQoaWRlYXBhZF9yZmtfZGF0YVtpXS5jZmdiaXQsICZwcml2LT5jZmcpKQogCQkJaWRlYXBh
ZF9yZWdpc3Rlcl9yZmtpbGwocHJpdiwgaSk7Ci0tIAoyLjM3LjMKCg==

--------------CIghPnbKIyhFTcHld3TVpFpE--

