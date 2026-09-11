Received: from fhigh-b8-smtp.messagingengine.com (fhigh-b8-smtp.messagingengine.com [202.12.124.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 466AF377ED4
	for <platform-driver-x86@vger.kernel.org>; Fri, 11 Sep 2026 09:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789117359; cv=none; b=kSkcqPcpbTTDz+8ztiZnymRAMdi9vEn1YlzRibPx9fV7s0KeVuLI6eNbgIXpSqe5IfaW77NCw2e7pVYrK3uUe53klbQNtKWff2fmZFpjsP+2SI4BlfqxSXuYQ64JI8b9TZK/eJ1p9fpZmBivay/vb17ll9CiIK2zcd6dd+pJIsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789117359; c=relaxed/simple;
	bh=7EOHDjYkFflVrVjO3hY7Uw11E3J1n1vT5kF6g+Gqqig=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=cAx+14z5cnT9KQwX/BwSz4V9w/fo/bdPzwQBtipXb8794qrBC+2ssu5/9ftkqdA/Sphm/YGbAPSP3h7gI4ejtzuppJMiyQt00VnhKEiiafVIjzKX/QkkK9Sp22Ot2dLY03uw6EiRHYjkSGz1VZFXYvIgX/BUU1mXhLlutESDETw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.im; spf=pass smtp.mailfrom=fastmail.im; dkim=pass (2048-bit key) header.d=fastmail.im header.i=@fastmail.im header.b=eqYG7yH1; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=OWnk2xJ5; arc=none smtp.client-ip=202.12.124.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.im
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastmail.im
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fastmail.im header.i=@fastmail.im header.b="eqYG7yH1";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="OWnk2xJ5"
Received: from ams-compute-01.internal (ams-compute-01.internal [10.64.2.61])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 8CA337A0014;
	Fri, 11 Sep 2026 05:02:34 -0400 (EDT)
Received: from ams-imap-09 ([10.64.2.29])
  by ams-compute-01.internal (MEProxy); Fri, 11 Sep 2026 05:02:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.im; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1789117353;
	 x=1789203753; bh=QVRBUvjN5bFSQtxgzNX+e3HQFbVuLZKLeDEcZWl+/bI=; b=
	eqYG7yH1vrj9Bd8vsoFqfOo4rwJhMLvAswUCzPZuz/SCT4cJNXi43oo/IzVVYRZa
	YxG9YgV9vOzYGdzdw0++a6P4kn2r7Wa7zJhoybRlfW3CWza9o31A6AXxcAn03p78
	dcwWdJ0k2tj7UOmZhafEmsjb0Om36e+inFgA9yg7QgWZdWoHD+PZ5viHXVyc8REY
	YDbiAICgJxtd9omUWIDwbhrk5C2wLMS1N32vvNmL4Zsjxd68ehOFBMfRNavHK8K9
	EX1PuVe0SLPe/O0E5qYFrmEQdGMbchMUalYBDLw84Y6jF9zoDWMdO5NhU9Q+w/Fy
	jV40QohMQDHGUJhIR7aEtw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1789117353; x=
	1789203753; bh=QVRBUvjN5bFSQtxgzNX+e3HQFbVuLZKLeDEcZWl+/bI=; b=O
	Wnk2xJ5I33790hnoQKX/yR0nvP7xwJQvYlf2RX1KqYkPva1RfsmiHpTxEoNVK66K
	phxkGaN4klUVOJyy7tUdVBMsgtqJe+NAnIfbQ7jgMYYf7oUIFfLR6EF4pLanXQ/Y
	19nE+FeQ3ki1PbA4qbpx5DQ1Qgre/xIu5NH9EMCqvV6GUgGwaTP2gnUiHP0ZY7z8
	PRrO0UGMjfpJsrbCy8/hRTymhwYDYluhaYKEI2IUNiLMVjzVgY3BT96Sozkvzrxx
	0QWtRdrQRms0JuKuzOVWt015Vcg5mkL9dvyBFkyVUHjnCOZMS4ob30RNaMF3KyE2
	NC08O/A5un080Hz869FVQ==
X-ME-Sender: <xms:p8OjalfkA4JgGw7lYDb6qFBlX7_0ZgaxsXZp1RtoLza2MwI3dmZotw>
    <xme:p8OjauA2kagxs6W39DzScNpWpocqfVafHK0c6URjSoFWzPxlRG6foIlQvPRgPdJjR
    Z2c9hg5_gsT1QbQ_Ao1bM-EoV1Ax_I5YGVbenYi1M4-ODOIXMNLatQ>
X-ME-Proxy-Cause: dmFkZTGIzHzEBLbuCiK0dRcz+vA7sG9ZKhpj+Axvx0BpnR2b0SJlWgcYw/PATY6xVSnYZH
    AVRUQgE6aKpQIu0jj3blDBySpsBsp7wvUzmF4jcS5IR4HdJYcw+yYXLjELKht5nt2iXoIR
    tidwChuLiQTGxZc7fo1Zr3n2l2x86iUAiJ8y0TieDYEShGCrAYdTxNNffu2rZHj2r7xbNN
    oHiRNmLP+r8ZgdTulMA69Y8mPY7cZDTiALw+oQATEHv0+9VZOd2tFsPBZhsaikyugt9hLv
    sZsNMAKH8n1iaNKUgSr7t5qUFtIXUjN9MgzSDBWQwyjpNrl1LmsiruhfrBG8f8gLPWOBoL
    oJND93dlrXfzpK9EiJMv5DzDhjQxrbPyB0r6fRiMpSyQChBger6EqcLVnidmC4GRGLWDLo
    DCMw14IQhr5ZQIX6W6erhdwjWjVxYxK7NC4FztGoizr8VV6bTVT9ifh4Erg5inCWDQQ0+O
    XQcfnjdjOZpxUUBmpa3Ak9G7y5LgFcSxKjUp6n3I/qsQqk9ARGJviC+Rs4Fqf4DgKc7VbW
    6F+HFp/WjClybU/wd9xMirZtWukacp+H21iymVoO2Qw+4OjNQYjRdLHpJLOxWlCqpAqnG1
    v3Yo+lfbqGx031NNei4WCEVTeBVSkBkLHn2pgKqEkrWQ6pVWW1kX7SiAY6qA
X-ME-Proxy: <xmx:qMOjaoANoBmTai5VeRwb5dYdpRgcRfeV8Wpi6uvjTbYlcuTlLR4f3Q>
    <xmx:qMOjasDp56w31b2MaXLiX0KBG6Z0UtBVkYS1Sn1LeVY4l61Sm5NfWQ>
    <xmx:qMOjarrD1iy0LpGKDosm6DjIWVyBRNcCMaHV1pBAVG5lgZ7Jfdj_cw>
    <xmx:qMOjaunLvsquhYK7JsIhxb4jIlcJAXeZaIJHLQWxWO97_LWl4ERH0Q>
    <xmx:qcOjakFHCJmvDQtoyVZ_m5WxDSS9uJCO-487gUw3Y30VuhoaL_9OoVKG>
Feedback-ID: i559e4809:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 3A903180098; Fri, 11 Sep 2026 05:02:31 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Fri, 11 Sep 2026 12:01:16 +0300
From: "Alice Mikityanska" <alice.kernel@fastmail.im>
To: "Kevin Charpentier" <kevinccharpentier@gmail.com>
Cc: hansg@kernel.org, markgross@kernel.org,
 platform-driver-x86@vger.kernel.org, maxtram95@gmail.com
Message-Id: <5d11beec-b9ba-49ab-adfa-de5ad0cc4e69@app.fastmail.com>
In-Reply-To: 
 <CAH4z8xHUrb3nHM7SS9s_3h9qo_Bu7Susf8ug5E==nFbHQMPCJg@mail.gmail.com>
References: 
 <CAH4z8xHUrb3nHM7SS9s_3h9qo_Bu7Susf8ug5E==nFbHQMPCJg@mail.gmail.com>
Subject: Re: ideapad-laptop: duplicate KEY_MICMUTE events on ThinkBook 14 G7 ARP (ACPI
 and WMI both report)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 11, 2026, at 05:49, Kevin Charpentier wrote:
> Hi,
>
> I am reporting a bug where the mic-mute key (Fn+F4) is reported twice =
by
> ideapad-laptop on a Lenovo ThinkBook 14 G7 ARP, which makes the key ap=
pear
> not to work at all under GNOME.
>
> This is my first report to this list, so please let me know if anythin=
g is
> missing or should be sent differently.
>
> System
> ------
> Machine:  Lenovo ThinkBook 14 G7 ARP (21MV)
> BIOS:     P6CN34WW, 03/10/2026 (EC 1.37, BIOS release 1.34)
> Kernel:   7.2.4-200.fc44.x86_64 (Fedora 44)
> Module:   drivers/platform/x86/lenovo/ideapad-laptop.ko
>
> DMI modalias:
> dmi:bvnLENOVO:bvrP6CN34WW:bd03/10/2026:br1.34:efr1.37:svnLENOVO:pn21MV=
:pvrThinkBook14G7ARP:rvnLENOVO:rnLNVNB161216:rvrNODPK:cvnLENOVO:ct10:cvr=
ThinkBook14G7ARP:skuLENOVO_MT_21MV_BU_idea_FM_ThinkBook14G7ARP:pfaThinkB=
ook14G7ARP:
>
> Symptom
> -------
> Pressing Fn+F4 appears to do nothing. The GNOME on-screen indicator do=
es
> appear and the mic-mute LED blinks, but the microphone mute state is
> unchanged. Roughly one press out of several does take effect, which I
> believe happens when the firmware drops one of the two notifications.
>
> The key is not unmapped: KEY_MICMUTE is emitted correctly. It is emitt=
ed
> twice per physical keypress, 1-7 ms apart, so the userspace toggle is
> applied an even number of times and the state returns to its original
> value before anything can observe it.
>
> Note that polling the mute state does not reveal this. Both toggles ha=
ppen
> within ~7 ms, so a 100 ms poll of the PipeWire source sees no change a=
t all
> and the key looks completely dead.
>
> Evidence
> --------
> Three physical keypresses, via `sudo libinput debug-events --show-keyc=
odes`.
> Note the millisecond-apart pairs, which cannot be produced by a finger:
>
> -event12  KEYBOARD_KEY   +0.860s    KEY_MICMUTE (248) pressed
>  event12  KEYBOARD_KEY   +0.860s    KEY_MICMUTE (248) released
>  event12  KEYBOARD_KEY   +0.867s    KEY_MICMUTE (248) pressed
>  event12  KEYBOARD_KEY   +0.868s    KEY_MICMUTE (248) released
>  event12  KEYBOARD_KEY   +3.137s    KEY_MICMUTE (248) pressed
>  event12  KEYBOARD_KEY   +3.137s    KEY_MICMUTE (248) released
>  event12  KEYBOARD_KEY   +3.140s    KEY_MICMUTE (248) pressed
>  event12  KEYBOARD_KEY   +3.140s    KEY_MICMUTE (248) released
>  event12  KEYBOARD_KEY   +4.886s    KEY_MICMUTE (248) pressed
>  event12  KEYBOARD_KEY   +4.886s    KEY_MICMUTE (248) released
>  event12  KEYBOARD_KEY   +4.891s    KEY_MICMUTE (248) pressed
>  event12  KEYBOARD_KEY   +4.891s    KEY_MICMUTE (248) released
>
> All events come from the same input device, "Ideapad extra buttons"
> (phys=3Dideapad/input0), created by ideapad-laptop.
>
> Analysis
> --------
> On this machine ideapad-laptop is bound to two devices at the same tim=
e,
> and both report this key into the same input device:
>
>   1. ACPI: platform device VPC2004:00 (driver ideapad_acpi)
>   2. WMI:  8FC0DE0C-B4E4-43FD-B0F3-8871711C1294-17 (driver ideapad_wmi=
),
>            notify_id D0, instance_count 1
>
> Unbinding the WMI device removes the duplicate completely:
>
>   echo 8FC0DE0C-B4E4-43FD-B0F3-8871711C1294-17 > \
>        /sys/bus/wmi/drivers/ideapad_wmi/unbind
>
> After the unbind, the same three keypresses produce single events, with
> human-scale gaps instead of millisecond pairs:
>
>  event12  KEYBOARD_KEY   +0.298s    KEY_MICMUTE (248) pressed/released
>  event12  KEYBOARD_KEY   +1.043s    KEY_MICMUTE (248) pressed/released
>  event12  KEYBOARD_KEY   +2.880s    KEY_MICMUTE (248) pressed/released
>
> The key then works correctly in GNOME, and so does the mic-mute LED.
>
> I also verified that unbinding the WMI device does not regress anything
> else exposed by the driver: fn_lock, conservation_mode, camera_power,
> usb_charging and fan_mode still respond, the platform::fnlock,
> platform::kbd_backlight, platform::mute and platform::micmute LEDs are
> still present, and the kernel logs no errors.
>
> Questions
> ---------
> I am not sure where the fix belongs, so I am reporting rather than
> proposing a patch:
>
>   - Is the firmware expected to notify this key on both the ACPI and t=
he
>     WMI path, with the driver responsible for reporting it only once?
>   - Or should ideapad-laptop not register the WMI hotkey path on models
>     where the ACPI path already reports these keys?
>
> I am happy to test patches or gather any further information. I can al=
so
> provide the full acpidump, the WMI BMOF dump, or udev debug logs if th=
at
> helps.

Hi Kevin,

Thanks for the detailed report!

Usually, duplicate keys are handled on udev level, see /lib/udev/hwdb.d/=
60-
keyboard.hwdb: it contains lots of definitions with "=3Dunknown", which
unmap certain keys, often because they are already handled by another
input device. Although adding a kernel quirk is also possible.

There is no need to unbind or blacklist the entire WMI driver for this.
You can try adding a rule locally to /etc/udev/hwdb.d/61-keyboard-
custom.hwdb, run `systemd-hwdb update`, and reboot to test it. The rule
will probably look like this (I can't test it):

evdev:name:Ideapad extra buttons:dmi:*:svnLENOVO:pn21MV:pvrThinkBook14G7=
ARP:*
 KEYBOARD_KEY_13e=3Dunknown

If it doesn't work on the first attempt, try making the DMI match more
generic for testing. From the source code of ideapad-laptop, I see that
MICMUTE scan codes are 8 and 0x13e =E2=80=94 you need to unmap one of th=
ose.

If that works, you can submit a pull request to systemd.

Hope that helps,
Alice

> Workaround for other users of this model
> ----------------------------------------
> A udev rule that unbinds the WMI device at boot:
>
> ACTION=3D=3D"bind", SUBSYSTEM=3D=3D"wmi",
> ATTR{guid}=3D=3D"8FC0DE0C-B4E4-43FD-B0F3-8871711C1294", RUN+=3D"/bin/s=
h -c
> 'grep -qx 21MV /sys/class/dmi/id/product_name && echo %k >
> /sys/bus/wmi/drivers/ideapad_wmi/unbind'"
>
> Thanks,
> Kevin Christian Charpentier
