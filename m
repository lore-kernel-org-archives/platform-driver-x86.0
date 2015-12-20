From: =?UTF-8?Q?Jo=C3=A3o_Paulo_Rechi_Vita?= <jprvita@gmail.com>
Subject: Re: [PATCH 1/4] platform/x86: Add Asus Wireless Radio Control driver
Date: Sun, 20 Dec 2015 12:00:58 -0500
Message-ID: <CA+A7VXWsbhErwbtxmX+fUWf_BfTQKwqKru4rzbHPhAKgbTmafA@mail.gmail.com>
References: <1450193442-7930-1-git-send-email-jprvita@endlessm.com>
 <1450193442-7930-2-git-send-email-jprvita@endlessm.com> <20151219072324.GF7244@malice.jf.intel.com>
 <CA+A7VXU9MepWmWL6BS+XyjbLs2s_ONR5Yy3tqT--cbYS7p1P1Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-yk0-f194.google.com ([209.85.160.194]:36055 "EHLO
	mail-yk0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753219AbbLTRBk convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 20 Dec 2015 12:01:40 -0500
Received: by mail-yk0-f194.google.com with SMTP id v6so9814055ykc.3
        for <platform-driver-x86@vger.kernel.org>; Sun, 20 Dec 2015 09:01:40 -0800 (PST)
In-Reply-To: <CA+A7VXU9MepWmWL6BS+XyjbLs2s_ONR5Yy3tqT--cbYS7p1P1Q@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: Mousou Yuu <guogaishiwo@gmail.com>, Corentin Chary <corentin.chary@gmail.com>, platform-driver-x86@vger.kernel.org, acpi4asus-user@lists.sourceforge.net, =?UTF-8?Q?Jo=C3=A3o_Paulo_Rechi_Vita?= <jprvita@endlessm.com>

On 19 December 2015 at 02:23, Darren Hart <dvhart@infradead.org> wrote:
> On Tue, Dec 15, 2015 at 10:30:39AM -0500, Jo=C3=A3o Paulo Rechi Vita =
wrote:
>
> ...
>
>> +static void asus_wrc_notify(struct acpi_device *device, u32 event)
>> +{
>> + struct asus_wrc_data *data =3D acpi_driver_data(device);
>> +
>> + pr_debug("event=3D0x%X\n", event);
>> +
>> + if (!sparse_keymap_report_event(data->inputdev, event, 1, true))
>> + pr_info("Unknown ASHS event: 0x%X\n", event);
>> +}
>> +
>> +static int asus_wrc_add(struct acpi_device *device)
>> +{
>> + struct asus_wrc_data *data;
>> + int err =3D -ENOMEM;
>> +
>> + pr_info(ASUS_WRC_MODULE_NAME"\n");
>> +
>> + data =3D kzalloc(sizeof(struct asus_wrc_data), GFP_KERNEL);
>> + if (!data)
>> + return -ENOMEM;
>> +
>> + data->inputdev =3D input_allocate_device();
>> + if (!data->inputdev)
>> + goto fail;
>> +
>> + data->inputdev->name =3D "Asus Wireless Radio Control";
>> + data->inputdev->phys =3D "asus-wrc/input0";
>> + data->inputdev->id.bustype =3D BUS_HOST;
>> + data->inputdev->dev.parent =3D &device->dev;
>> + set_bit(EV_REP, data->inputdev->evbit);
>
> The version Mousou includes some minor differences:
>
> + switch_dev->id.vendor =3D PCI_VENDOR_ID_ASUSTEK;
>
> The vendor addition seems appropriate.

 Agree, I'll add that.

> The rest appears to be a slightly more directly approach to a sparse
> keymap
> which seems like overkill for a driver with a single key.
>
> + set_bit(EV_KEY, switch_dev->evbit);
> + set_bit(KEY_RFKILL, switch_dev->keybit);
>
> Mousou's driver results in about 30 less lines as well. Please compar=
e and
> see
> if we might be able to merge the best of each version.
>

I only had the time to skim through Mousou's patch yet, but I'll check =
it in
detail and try to incorporate things that I might have missed.

--
Jo=C3=A3o Paulo Rechi Vita
http://about.me/jprvita
