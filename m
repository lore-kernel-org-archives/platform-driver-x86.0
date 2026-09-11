Received: from mail-oo2-f43.google.com (mail-oo2-f43.google.com [74.125.231.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66EB9322C6D
	for <platform-driver-x86@vger.kernel.org>; Fri, 11 Sep 2026 14:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789137970; cv=pass; b=nt7jAPE2NH04/Z7FHTdKo1nXQfqkkrHmGGn2UtcjdE2GeJoo5Y8m3CdKryM+N4IRTVxXzwlvMZdABVp7L5tLgkk2PPV3dWbrLsr5Z7qtk/JXkfPFrScKzMqVhY92zA9eV9YmqDEAQBTs5gABMxQrdQOBQjEilSoCe2zLMp7uLqU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789137970; c=relaxed/simple;
	bh=ja0K6dnmSFSsDcrNn/bNwdgeGxpNfeNHwQq4Q0xubmM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FSxuNK/aVwABGowXa3cotXwB3oQgMsHCUhRt1MYC1pSm6AZlwVRuK0gDT8xE5U62ChAciIQQ9XtNPjwXfhFkawzoA+cbIkBZd4m6l8BeIrKgwvcUY+oARtDpsldZ7oju11jwOaO3DCbx5Rhvf6+4g57vLClZjCE6OeOWOX6XX90=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eHMjTu5h; arc=pass smtp.client-ip=74.125.231.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eHMjTu5h"
Received: by mail-oo2-f43.google.com with SMTP id 46e09a7af769-7f4f0cfb29cso530535a34.1
        for <platform-driver-x86@vger.kernel.org>; Fri, 11 Sep 2026 07:46:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789137967; cv=none;
        d=google.com; s=arc-20260327;
        b=d0QzM0GA4SoIP99l5qkhyqLJpuBFr7CSXBChjwwej86wUCZbiZz2i1+74WlCLet61A
         xYAfXm+PnAQJOK+I8ud/KLU8Zq5d1526rYW5wHSx2gKlcp/w2TFC3L/l0bQJdypYSIPh
         LFYU8jWOWQKB+uaM9KO6Kn98pkBtHr1+b9nTejfTwh6pFYUpGDD0WbTYMwsJIFRPTqbx
         vsTSH8/Txbe0OwFU3LWbyQ6MA0MkXwTselxfJ29BZFLiX+OggsH0O1pxkeXb0ag7kFAV
         AcfUjmp0P3A2MV4Zu9shs/gcFdPLb/JM9E9Ut33Gizfn8iWBEs5mzgGVfD5e+aQGbviD
         EPZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OdfHDoSp865YUPrEjWxkJWbY9lpo5eKY5yjY+/tOjZo=;
        fh=O5gI+JK+2OaNHuabB+ogJEn/9t8vvb+2+DdjxxX7jJw=;
        b=Gi5IaHnPBOnf7jOT8TJ0ctO3/JbaDwFU2bP1vAFuVmvapOuqgTYdWKez+pzwxHYfMx
         IS2TVJUiseVu1SYLwJaoQn+Zhie2iwcXOQ+Of/S4lU7UIaGft/HDJdMx4yvbxiVwVthL
         f9osPbNkGnasnzluDJFeEc6BCgZc7hz80Qs3RNEzYX0LqBKmhipTqJ04npZr9ZD61O6L
         DV1FgqiZFXYe2BSigXfSPx0VyQ4gbbSU/KU2TUfWtwHra800oH+TVh6uQRrcHZs7ygmC
         QhkRncJDNpLySKVsJs85Oeg2O+mgnD2EwzYj5kD6CYH8h+MqKAHLxjIeKfQGxSdpPLJl
         7z7Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789137967; x=1789742767; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OdfHDoSp865YUPrEjWxkJWbY9lpo5eKY5yjY+/tOjZo=;
        b=eHMjTu5h1w04LYgU2185LocLvWQhL+vz5B3of9vFjnPVWhE82c5s2vSkbjsT9nnCXr
         hty4yd4vIy03BNcVK9X5LLzKNVWkZc4Ut2X+0X3F2Q/7ZdV2LQzbDIrIeTEvDLq2aHNj
         4FZ40diOa83j4ov8BbAfxFIAmDoMqyqr7gqviWJVfhZAfjzxyj2iouWKGEtfkqccrKSy
         Qoon4UdmZWjwxKUy/jcQ1slp0fMMr6z+emPZVnGyrwSQ1NeA58Wj6AHy5Phr/NDxD2Ey
         ysIH2qmQ8ejiEqW5eeeODhxFBpQwtRETInzswkGCkrdndJucFTs1u9vFVUUL7fEudAwd
         6rnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789137967; x=1789742767;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OdfHDoSp865YUPrEjWxkJWbY9lpo5eKY5yjY+/tOjZo=;
        b=X6iThyY3oTuFF8ibXDROgS4UJOfegpUb7Qn3yXVkw/A/WNTvWjq5lEvz/qYuKNn1W4
         EhnqGoAs85RF7MqBBfwN/oSrtvOOJXNLqNeOxzb0eQP2IiymRNE5Jn4On06iqEm3OGhD
         ZDFODr7tu9JtyMNRCuzLWtG0RbHTIvxTxXWWpjTEplQklBxLJKsG5/QC+u4oLbIJcSkw
         fGD97acK9edmem2IQVZruFminANMc3GQHMHx7gO1dit6yMiONzlPSImabEd040kpfSOI
         HEGk1R47donQfqJ56e+A0MbAZLhQWsmFxXX04IIPKHyYoLRg+FXw9ldREkuDF1QtY+VS
         EaIQ==
X-Forwarded-Encrypted: i=1; AKwUvBygWl0UCsTyv3/p0yo//9UBhnqNCGxrArnLqGTs7EmYwLJ26Z6TSEY70B0W9+PrEHrJ/0hOi65URm2md0P+L8Yu4kPQ@vger.kernel.org
X-Gm-Message-State: AFuF++m8JYDvKg6LoGdWIrT+kRO94jtH0cqRRq3Vkp+hnWTJ2X+9xpAp
	F9OJAANuBk4l88BMyDZynF2o2ar3nhhToRhUd2AHhOLy6+BgeOJczjS8MQIdRKMO19BAVnUf1CA
	y5hPmGgqfvkPiis55cnoGHGrYiz+huxg=
X-Gm-Gg: AYBFou1PxnMaheXTwzsVhwPBXS3CIkzJIPJtbsxdy2iOCKDKKJrifUUWgc94mYoNWKV
	9jj+VvoXvhteQvQe13HgFoJO44LryiNPDQzsclKZbW7vCoT5irfeLFXfh/eIpgNF0ZrdHiNAuiy
	7sqbJzaA8VzBK3iVEdkkkgKSdxcUTLMZfgte6MDOwxvrjZf5PAPFSY7239RAUU2W0W7qd4i00JI
	+PNi4KVz/jdlTSDFKcPr2jxxm3kQ7+UXymM4vn3Ku4ySZjScc0hT24GNWrDf7WkmTElUe24Q498
	WTelq9QcThz68hI0/5PvpbkSWIkeJ6EksRhPaLKqHagUcMNpktcfeiODPA==
X-Received: by 2002:a05:6830:82c3:b0:7f6:ec23:7956 with SMTP id
 46e09a7af769-803fe1bd730mr7686515a34.2.1789137967119; Fri, 11 Sep 2026
 07:46:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAH4z8xHUrb3nHM7SS9s_3h9qo_Bu7Susf8ug5E==nFbHQMPCJg@mail.gmail.com>
 <5d11beec-b9ba-49ab-adfa-de5ad0cc4e69@app.fastmail.com>
In-Reply-To: <5d11beec-b9ba-49ab-adfa-de5ad0cc4e69@app.fastmail.com>
From: Kevin Charpentier <kevinccharpentier@gmail.com>
Date: Fri, 11 Sep 2026 11:45:29 -0300
X-Gm-Features: AcwNN1WAPGOJs8JXRgu4XCYXl-NZ7FsYl2LDpjnUMi9RY0Tf1N5K50F9qWFuRHg
Message-ID: <CAH4z8xFHq9_cQME2qfjBi5Yt8KRHxc17U17rEP0nebX82zXtyA@mail.gmail.com>
Subject: Re: ideapad-laptop: duplicate KEY_MICMUTE events on ThinkBook 14 G7
 ARP (ACPI and WMI both report)
To: alice.kernel@fastmail.im
Cc: hansg@kernel.org, markgross@kernel.org, 
	platform-driver-x86@vger.kernel.org, maxtram95@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 11, 2026, Alice wrote:
> Usually, duplicate keys are handled on udev level, see
> /lib/udev/hwdb.d/60-keyboard.hwdb [...] From the source code of
> ideapad-laptop, I see that MICMUTE scan codes are 8 and 0x13e - you need
> to unmap one of those.

That worked, thanks a lot. Confirming with details in case they are useful.

The two paths do use different scan codes, so unmapping one is enough and
the WMI driver can stay bound. Reading the raw evdev stream from "Ideapad
extra buttons" while pressing Fn+F4 three times, before any change:

  +7.176s  MSC_SCAN =3D 0x8    EV_KEY 248 (KEY_MICMUTE) pressed/released
  +7.182s  MSC_SCAN =3D 0x13e  EV_KEY 248 (KEY_MICMUTE) pressed/released
  +10.878s MSC_SCAN =3D 0x8    EV_KEY 248 (KEY_MICMUTE) pressed/released
  +10.878s MSC_SCAN =3D 0x13e  EV_KEY 248 (KEY_MICMUTE) pressed/released
  +14.747s MSC_SCAN =3D 0x8    EV_KEY 248 (KEY_MICMUTE) pressed/released
  +14.752s MSC_SCAN =3D 0x13e  EV_KEY 248 (KEY_MICMUTE) pressed/released

0x8 is the ACPI path (VPC2004:00) and 0x13e is the WMI path
(8FC0DE0C-B4E4-43FD-B0F3-8871711C1294-17). I verified this by unbinding
ideapad_wmi, which left only the 0x8 events.

Your rule worked as written, with no changes and no reboot needed:

evdev:name:Ideapad extra buttons:dmi:*:svnLENOVO:pn21MV:pvrThinkBook14G7ARP=
:*
 KEYBOARD_KEY_13e=3Dunknown

After `systemd-hwdb update` and `udevadm trigger --action=3Dchange
/sys/class/input/event12`, the second event is reported as KEY_UNKNOWN
(240) instead of KEY_MICMUTE, and the key now toggles the microphone
reliably on every press, including the mic-mute LED:

  +5.268s  MSC_SCAN =3D 0x8    EV_KEY 248 pressed/released
  +5.273s  MSC_SCAN =3D 0x13e  EV_KEY 240 pressed/released

I will submit this to systemd as a pull request against 60-keyboard.hwdb.

One question, only if it is worth your time: is it expected that this
firmware reports the same key on both paths, or is the ThinkBook 14 G7 ARP
simply a model that was never covered by a quirk? I ask because there is no
entry for this machine (pn21MV) in 60-keyboard.hwdb, while several other
ThinkBook models are listed, so I do not know whether other keys on this
laptop are affected in the same way and just have not been noticed yet.

Thanks again for the quick and clear answer. As a first-time reporter, it
was much easier than I expected.

Kevin Christian Charpentier


On Fri, Sep 11, 2026, Alice wrote:
>
> On Fri, Sep 11, 2026, at 05:49, Kevin Charpentier wrote:
> > Hi,
> >
> > I am reporting a bug where the mic-mute key (Fn+F4) is reported twice b=
y
> > ideapad-laptop on a Lenovo ThinkBook 14 G7 ARP, which makes the key app=
ear
> > not to work at all under GNOME.
> >
> > This is my first report to this list, so please let me know if anything=
 is
> > missing or should be sent differently.
> >
> > System
> > ------
> > Machine:  Lenovo ThinkBook 14 G7 ARP (21MV)
> > BIOS:     P6CN34WW, 03/10/2026 (EC 1.37, BIOS release 1.34)
> > Kernel:   7.2.4-200.fc44.x86_64 (Fedora 44)
> > Module:   drivers/platform/x86/lenovo/ideapad-laptop.ko
> >
> > DMI modalias:
> > dmi:bvnLENOVO:bvrP6CN34WW:bd03/10/2026:br1.34:efr1.37:svnLENOVO:pn21MV:=
pvrThinkBook14G7ARP:rvnLENOVO:rnLNVNB161216:rvrNODPK:cvnLENOVO:ct10:cvrThin=
kBook14G7ARP:skuLENOVO_MT_21MV_BU_idea_FM_ThinkBook14G7ARP:pfaThinkBook14G7=
ARP:
> >
> > Symptom
> > -------
> > Pressing Fn+F4 appears to do nothing. The GNOME on-screen indicator doe=
s
> > appear and the mic-mute LED blinks, but the microphone mute state is
> > unchanged. Roughly one press out of several does take effect, which I
> > believe happens when the firmware drops one of the two notifications.
> >
> > The key is not unmapped: KEY_MICMUTE is emitted correctly. It is emitte=
d
> > twice per physical keypress, 1-7 ms apart, so the userspace toggle is
> > applied an even number of times and the state returns to its original
> > value before anything can observe it.
> >
> > Note that polling the mute state does not reveal this. Both toggles hap=
pen
> > within ~7 ms, so a 100 ms poll of the PipeWire source sees no change at=
 all
> > and the key looks completely dead.
> >
> > Evidence
> > --------
> > Three physical keypresses, via `sudo libinput debug-events --show-keyco=
des`.
> > Note the millisecond-apart pairs, which cannot be produced by a finger:
> >
> > -event12  KEYBOARD_KEY   +0.860s    KEY_MICMUTE (248) pressed
> >  event12  KEYBOARD_KEY   +0.860s    KEY_MICMUTE (248) released
> >  event12  KEYBOARD_KEY   +0.867s    KEY_MICMUTE (248) pressed
> >  event12  KEYBOARD_KEY   +0.868s    KEY_MICMUTE (248) released
> >  event12  KEYBOARD_KEY   +3.137s    KEY_MICMUTE (248) pressed
> >  event12  KEYBOARD_KEY   +3.137s    KEY_MICMUTE (248) released
> >  event12  KEYBOARD_KEY   +3.140s    KEY_MICMUTE (248) pressed
> >  event12  KEYBOARD_KEY   +3.140s    KEY_MICMUTE (248) released
> >  event12  KEYBOARD_KEY   +4.886s    KEY_MICMUTE (248) pressed
> >  event12  KEYBOARD_KEY   +4.886s    KEY_MICMUTE (248) released
> >  event12  KEYBOARD_KEY   +4.891s    KEY_MICMUTE (248) pressed
> >  event12  KEYBOARD_KEY   +4.891s    KEY_MICMUTE (248) released
> >
> > All events come from the same input device, "Ideapad extra buttons"
> > (phys=3Dideapad/input0), created by ideapad-laptop.
> >
> > Analysis
> > --------
> > On this machine ideapad-laptop is bound to two devices at the same time=
,
> > and both report this key into the same input device:
> >
> >   1. ACPI: platform device VPC2004:00 (driver ideapad_acpi)
> >   2. WMI:  8FC0DE0C-B4E4-43FD-B0F3-8871711C1294-17 (driver ideapad_wmi)=
,
> >            notify_id D0, instance_count 1
> >
> > Unbinding the WMI device removes the duplicate completely:
> >
> >   echo 8FC0DE0C-B4E4-43FD-B0F3-8871711C1294-17 > \
> >        /sys/bus/wmi/drivers/ideapad_wmi/unbind
> >
> > After the unbind, the same three keypresses produce single events, with
> > human-scale gaps instead of millisecond pairs:
> >
> >  event12  KEYBOARD_KEY   +0.298s    KEY_MICMUTE (248) pressed/released
> >  event12  KEYBOARD_KEY   +1.043s    KEY_MICMUTE (248) pressed/released
> >  event12  KEYBOARD_KEY   +2.880s    KEY_MICMUTE (248) pressed/released
> >
> > The key then works correctly in GNOME, and so does the mic-mute LED.
> >
> > I also verified that unbinding the WMI device does not regress anything
> > else exposed by the driver: fn_lock, conservation_mode, camera_power,
> > usb_charging and fan_mode still respond, the platform::fnlock,
> > platform::kbd_backlight, platform::mute and platform::micmute LEDs are
> > still present, and the kernel logs no errors.
> >
> > Questions
> > ---------
> > I am not sure where the fix belongs, so I am reporting rather than
> > proposing a patch:
> >
> >   - Is the firmware expected to notify this key on both the ACPI and th=
e
> >     WMI path, with the driver responsible for reporting it only once?
> >   - Or should ideapad-laptop not register the WMI hotkey path on models
> >     where the ACPI path already reports these keys?
> >
> > I am happy to test patches or gather any further information. I can als=
o
> > provide the full acpidump, the WMI BMOF dump, or udev debug logs if tha=
t
> > helps.
>
> Hi Kevin,
>
> Thanks for the detailed report!
>
> Usually, duplicate keys are handled on udev level, see /lib/udev/hwdb.d/6=
0-
> keyboard.hwdb: it contains lots of definitions with "=3Dunknown", which
> unmap certain keys, often because they are already handled by another
> input device. Although adding a kernel quirk is also possible.
>
> There is no need to unbind or blacklist the entire WMI driver for this.
> You can try adding a rule locally to /etc/udev/hwdb.d/61-keyboard-
> custom.hwdb, run `systemd-hwdb update`, and reboot to test it. The rule
> will probably look like this (I can't test it):
>
> evdev:name:Ideapad extra buttons:dmi:*:svnLENOVO:pn21MV:pvrThinkBook14G7A=
RP:*
>  KEYBOARD_KEY_13e=3Dunknown
>
> If it doesn't work on the first attempt, try making the DMI match more
> generic for testing. From the source code of ideapad-laptop, I see that
> MICMUTE scan codes are 8 and 0x13e =E2=80=94 you need to unmap one of tho=
se.
>
> If that works, you can submit a pull request to systemd.
>
> Hope that helps,
> Alice
>
> > Workaround for other users of this model
> > ----------------------------------------
> > A udev rule that unbinds the WMI device at boot:
> >
> > ACTION=3D=3D"bind", SUBSYSTEM=3D=3D"wmi",
> > ATTR{guid}=3D=3D"8FC0DE0C-B4E4-43FD-B0F3-8871711C1294", RUN+=3D"/bin/sh=
 -c
> > 'grep -qx 21MV /sys/class/dmi/id/product_name && echo %k >
> > /sys/bus/wmi/drivers/ideapad_wmi/unbind'"
> >
> > Thanks,
> > Kevin Christian Charpentier
