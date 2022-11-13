Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAEBCC4332F
	for <platform-driver-x86@archiver.kernel.org>; Sun, 13 Nov 2022 23:02:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233850AbiKMXC3 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 13 Nov 2022 18:02:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233793AbiKMXC2 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 13 Nov 2022 18:02:28 -0500
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A608CDED2
        for <platform-driver-x86@vger.kernel.org>; Sun, 13 Nov 2022 15:02:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
        t=1668380537; bh=dDTuwNO40tqN3IxKHloP5xqTeSLWClMbpYtJaZq2mWc=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=nrwr6EqSCGoebIcH8Nl/OkBWjdHEYPmdK9HUd2d6kmr8EgBJ79kuyUHMTW11i8lGS
         MtlGEZt+8r1wNhrHpwdobnMumKwsqSjI25h9xzq74pKvzYaNYYNfYWExDUo9QvJeQt
         tZjsqPwTG/FJCCceF0G8J9GdrlDXY1sRqt2I7FaQIlNZxbcTaPKkFkTLH9HC1m9d4X
         wrSogGqJBOL25f/s2YcyqtWIZihvgtmTBvLJ85pfzro60Qarte85G88AsjOerkPxWQ
         txZgulctHAJMj7e6ZFJArtUNZEq9j3ShLl2TrhUv3TP3GkHNM4h10bxZSIULI+uBiB
         vqDJHWfBc7O4g==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [141.30.226.129] ([141.30.226.129]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MMXQF-1oe3MV3YzH-00JaGL; Mon, 14
 Nov 2022 00:02:16 +0100
Subject: Re: [PATCH v2 1/2] platform/x86: wmi: Disambiguate WMI event data on
 some ACPI tables
To:     Philipp Jungkamp <p.jungkamp@gmx.net>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>
Cc:     platform-driver-x86@vger.kernel.org
References: <8d54fbbb-0933-aaea-5f66-bb7807f5506d@redhat.com>
 <20221113121259.14895-1-p.jungkamp@gmx.net>
 <828b7403-40a2-0da4-6bd2-b2370f05f998@gmx.de>
 <557b5e231fbf0b16cb9bd3c9d62e238770a7a12b.camel@gmx.net>
From:   Armin Wolf <W_Armin@gmx.de>
Message-ID: <6794a6cc-6049-66bf-cee8-a35105669fcb@gmx.de>
Date:   Mon, 14 Nov 2022 00:02:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <557b5e231fbf0b16cb9bd3c9d62e238770a7a12b.camel@gmx.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
X-Provags-ID: V03:K1:5cD8S+Ku1eTDxK7qhg4EsYWuupNMgZyIlbg/FADJf6bJqcHo0il
 wDlFfaOU43DxyrOvEKKeQvPtXb+EmQGFCtgpRphLWWfEeM7Ovw3wOiE6kiPwXKO7NxGXinx
 zJIVNyXSnHANIjtlHzjXGn2I0mbPr0xmGU7NmuzFpu7mAN0KYohQHNplDnJPkC4gVItPgTo
 cn6WNwpNL77pGE3Tz33gg==
UI-OutboundReport: notjunk:1;M01:P0:w3pguOQrP1E=;i7EkfyU6SBHrw+/36nMvBxzOI/Q
 oLeS6ByHNjJbPG5woINEC7QQIMX0ijCacZolyUF5vZgSI8qPsF03xUFTppbvKiKXBbFaQtXWt
 9oo4D1tIkozY0Sd6EpvuQ222qfy2MLV7vEMcQmDZ+WEMl1mCBuQl7InL88wW+5EcEznW/xun+
 te6x+8PBuS2TcakmL67Vj10oxnR7ohWPeDrSRyGiP8oR9SnLqSimB0V4YlG0Nz6ns3HKhgUuw
 qif2OcbAbi5je7UE3sypzesF8N98HC1DM5iXdCqvb86QGeuvaPjI3z+4ZZPiUfEZnDU8PAEGd
 CxFMYeZ/HWQojlxIiGe2yc1P+5aL8RKRzvxGAsXPrfl932HALnVDZtw8B7A2HMjJprI4fC3pG
 GXEFI8dnq1j4FRm4Om3yWaNm01rj7O6eXru6XgIGMPZbRvWQellsRV72LI4AXoLCAMOT3mL2l
 pa9jvBbyl48uEO6ffO9/br+jV8tUSWXH5DWR3Fwgq6S+JOjOCxi0xUm8zKABFEdCpzhKO9n3V
 xWY8/DCIr6Q1xMH1i5DQh9JaLrSgCcu0M+Zd82ZhoRECJ3ZjBxxdfKSECKf46L9kuABQVyUiV
 UFFJdKkUEXHnrrSG5NRLPViDxJKEaiY5WVt331FSwOnYBrH40yZHmQHb7mx2OAmVkbMjr+rJI
 LodTYHiJG7NSgoYWqyY61O4tzioRG5yHe6crU9kiYNGkfQWyX8l9y/BdrdyW6SFD3LxpGIgAq
 ws7DZpz61h2FBh3GCQQoB7lPYX/W58n7HdmlOwoCBKCESKzS03IpTotxuwyr8en0webdoLWgj
 SPnnoGKWwSbznptYCPbPwWiz+ZHCYFzXvvoIJLpbsnk90=
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Am 13.11.22 um 22:42 schrieb Philipp Jungkamp:

> On Sun, 2022-11-13 at 21:30 +0100, Armin Wolf wrote:
>> Am 13.11.22 um 13:12 schrieb Philipp Jungkamp:
>>
>>> The ACPI DSDT table includes multiple WMI blocks which emit events
>>> with
>>> the same notify_id. The wmi_get_event_data() function chooses the
>>> wmi_block with the _WED handler to call based on the notify_id.
>>> This
>>> function may call the wrong _WED event handler based on the order
>>> the
>>> WMI blocks are parsed.
>>>
>>> This introduces wmi_get_event_data_with_guid() to diambiguate the
>>> _WED
>>> call to get metadata for an event. The GUID here is the one of the
>>> containing WMI block, not the one of the WMI event itself.
>> Hello,
>>
>> maybe it would be better to instead rewrite the driver to utilize the
>> WMI bus infrastructure?
>> Because a GUID is not guaranteed to be unique inside a system, there
>> would still be a chance
>> to call the wrong _WED handler.
>> AFAIK only utilizing the WMI bus infrastructure would fully
>> disambiguate the WMI event data.
>>
>> Armin Wolf
>>
> Hello,
>
> I thought the same, so I implemented the bare minimum to support the
> GUID on my hardware using the WMI bus in the v1 patch.
>
> But I also agree with Hans in that it should probably reside in the
> ideapad-laptop driver, so there aren't two modules for the same
> hardware.
>
> Therefore I'd need to change the WMI handling part of ideapad-laptop in
> a way that does not break other hardware.
>
> I don't know how to write a driver which connects on two buses.
> The driver is currently for a platform device with the corresponding
> probe and remove hooks. How would I coordinate the private data
> allocation/deletion between the  platform-probe/-remove and wmi-probe/-
> remove in a way that is established by other drivers.
>
> Do you have a recommendation on how to setup a module to register on
> two buses or another driver that is good to learn from?
>
> Greetings,
> Philipp Jungkamp

Well, the current driver does the WMI registration when probing the platfo=
rm device,
so maybe you could just call wmi_driver_register() there?
Since the WMI notify handler may need to access the platform device, i sug=
gest to
store the wmi_driver struct inside the ideapad_private struct, and then us=
e container_of()
to get a reference from wmi_device->dev->driver to ideapad_private.
This should be safe as long as the WMI driver is unregistered on platform =
device removal.

Armin Wolf

>>> Signed-off-by: Philipp Jungkamp <p.jungkamp@gmx.net>
>>> ---
>>> Was separating this change into it's own commit correct?
>>>
>>>  =C2=A0 drivers/platform/x86/wmi.c | 30 ++++++++++++++++++++++++++++++
>>>  =C2=A0 include/linux/acpi.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0 3 +++
>>>  =C2=A0 2 files changed, 33 insertions(+)
>>>
>>> diff --git a/drivers/platform/x86/wmi.c
>>> b/drivers/platform/x86/wmi.c
>>> index 223550a10d4d..56b666f4b40b 100644
>>> --- a/drivers/platform/x86/wmi.c
>>> +++ b/drivers/platform/x86/wmi.c
>>> @@ -659,6 +659,36 @@ acpi_status wmi_get_event_data(u32 event,
>>> struct acpi_buffer *out)
>>>  =C2=A0 }
>>>  =C2=A0 EXPORT_SYMBOL_GPL(wmi_get_event_data);
>>>
>>> +/**
>>> + * wmi_get_event_data_with_guid - Get WMI data associated with an
>>> event by guid
>>> + *
>>> + * Consider using this instead of wmi_get_event_data() when the
>>> notify_id
>>> + * of the WMI event may not be unique among all WMI blocks of a
>>> device.
>>> + *
>>> + * @guid: GUID of the WMI block for this event
>>> + * @event: Event to find
>>> + * @out: Buffer to hold event data. out->pointer should be freed
>>> with kfree()
>>> + *
>>> + * Returns extra data associated with an event in WMI.
>>> + */
>>> +acpi_status wmi_get_event_data_with_guid(const char *guid, u32
>>> event, struct acpi_buffer *out)
>>> +{
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct wmi_block *wblock =
=3D NULL;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct guid_block *gblock;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0acpi_status status;
>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0status =3D find_guid(guid, =
&wblock);
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (ACPI_FAILURE(status))
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0return AE_NOT_FOUND;
>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0gblock =3D &wblock->gblock;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if ((gblock->flags & ACPI_W=
MI_EVENT) && gblock->notify_id
>>> =3D=3D event)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0return get_event_data(wblock, out);
>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return AE_NOT_FOUND;
>>> +}
>>> +EXPORT_SYMBOL_GPL(wmi_get_event_data_with_guid);
>>> +
>>>  =C2=A0 /**
>>>  =C2=A0=C2=A0 * wmi_has_guid - Check if a GUID is available
>>>  =C2=A0=C2=A0 * @guid_string: 36 char string of the form fa50ff2b-f2e8=
-45de-
>>> 83fa-65417f2f49ba
>>> diff --git a/include/linux/acpi.h b/include/linux/acpi.h
>>> index 3015235d65e3..51ac4d6bcae1 100644
>>> --- a/include/linux/acpi.h
>>> +++ b/include/linux/acpi.h
>>> @@ -423,6 +423,9 @@ extern acpi_status wmi_set_block(const char
>>> *guid, u8 instance,
>>>  =C2=A0 extern acpi_status wmi_install_notify_handler(const char *guid=
,
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0wmi_notify_handler handler,
>>> void *data);
>>>  =C2=A0 extern acpi_status wmi_remove_notify_handler(const char *guid)=
;
>>> +extern acpi_status wmi_get_event_data_with_guid(const char *guid,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0u32 e=
vent,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struc=
t acpi_buffer
>>> *out);
>>>  =C2=A0 extern acpi_status wmi_get_event_data(u32 event, struct
>>> acpi_buffer *out);
>>>  =C2=A0 extern bool wmi_has_guid(const char *guid);
>>>  =C2=A0 extern char *wmi_get_acpi_device_uid(const char *guid);
>>> --
>>> 2.38.1
>>>
