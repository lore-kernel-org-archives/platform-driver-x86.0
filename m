Received: from relay13.grserver.gr (relay13.grserver.gr [178.156.171.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DE291E487
	for <platform-driver-x86@vger.kernel.org>; Mon,  3 Nov 2025 09:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.156.171.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762161365; cv=none; b=AqjDgKqhYGg4plrHdQScAMo/5AoIOnFOSjVNcQ+E3dcdg9nf4LctANzEFaE9fAZZ/QURvEQXjWn0Eo6fmLGiWuAngvB9xAYduwNrkG/DhFcx1d0Ol8P1sOvoie+pfKb/1vToPGPzfQj8sZpSyFnWqNZVSNuRdMFq0FZ2F8c20Kk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762161365; c=relaxed/simple;
	bh=1LqMLotSxY10Jp86QNmgu22YWsSjuZLWOM6qwKKNY7M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oGSpWJE6KRUY/OtQgvU16PRa76mxLqgGozJ6IX+J4H8dT8UTnMdMjzAeRuuEZNnoHEtt75flDDHr8/BeKrPXGWFlxzyGw2AsYZVDC2Dayh7h3mJbu8QlejjOA/FSy7BhpsWGfATqBixNFdZynoGxczupmuDdVCFvqQ+LCVJEbAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=temperror (0-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=Bk8wkjKr; arc=none smtp.client-ip=178.156.171.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="Bk8wkjKr"
Received: from relay13 (localhost [127.0.0.1])
	by relay13.grserver.gr (Proxmox) with ESMTP id 46A315E4C7
	for <platform-driver-x86@vger.kernel.org>; Mon,  3 Nov 2025 11:16:02 +0200 (EET)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay13.grserver.gr (Proxmox) with ESMTPS id A33955E079
	for <platform-driver-x86@vger.kernel.org>; Mon,  3 Nov 2025 11:15:59 +0200 (EET)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id 20A461FF45C
	for <platform-driver-x86@vger.kernel.org>; Mon,  3 Nov 2025 11:15:58 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1762161358;
	bh=mBfN47Ps66g9AwmOuNEKmgOTCNmM3z5WpTbtNbjEvb0=;
	h=Received:From:Subject:To;
	b=Bk8wkjKrY8mhepNRl3jnISBMy4XWwBZ+hRBg9+S04R9x1K91Tw+TRZOQ/e2Fxryy2
	 CTFLe8ESzJbuSifZGx4hEN74AFktAeCpcTxJjYovTSmQMKuvTboC8T6rNUAKLBxpYl
	 +3tFdLM+XIkrrjBtlXL1W8ihmIoHvn3w/Eu7UtaWAwKNx/bLtmKHIXGo2rcS1sitPJ
	 mhvzZCrQ6WpdRavVgRjZ1AA2lKJcU2qgGZFvM1EwDjVWu4GtkWJt6k30bDOtm/1DCU
	 W5mBQbW9gqwwh4GeXccphYI/r6pna1Vg/qeNUipR8QpfUrGOCemVMqDltxh09kK26K
	 lKcqM6MZXJFlA==
Authentication-Results: linux3247.grserver.gr;
        spf=pass (sender IP is 209.85.167.46) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-lf1-f46.google.com
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-57bd04f2e84so5027574e87.1
        for <platform-driver-x86@vger.kernel.org>;
 Mon, 03 Nov 2025 01:15:58 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWwJ23ccFWjzzMlduWeOzdjDeDJCNyc014R3GhQK7AykN25Xv9GWlCoO2I5DmBo0MMtQ40+zj4wgq2AHv3nPwunbVi9@vger.kernel.org
X-Gm-Message-State: AOJu0Yw98CQmo7YKMvRNzcQs/cvOHPAbQkQnYWpOi65iYlp1WwOiHbgF
	F20dByuzC+lG5mo50mBcJjAxqvlTHwYpQ2ZMwdByrwWhkeY98CY5Zt9xe4l4T8KPsC9AsGW/Y5O
	r8oZxGq0YDIObeHbfDxOLhvqItflYDYg=
X-Google-Smtp-Source: 
 AGHT+IH3pxgRvfDIhuz+7cxv2UbGJlq5PthmW46fdCE5tXe/pB/LR7gQVnqf1CFY1YNmoHsJbHg9sZELmHB17ZrCEGA=
X-Received: by 2002:a05:6512:3c92:b0:587:6853:4caf with SMTP id
 2adb3069b0e04-5941d547a44mr3425303e87.40.1762161357570; Mon, 03 Nov 2025
 01:15:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: 
 <CAGwozwFgd91n2HnHn0VEL3BTGkj8QCRnp2jfCsMB38JqK8znNg@mail.gmail.com>
 <20251103042848.9302-1-derekjohn.clark@gmail.com>
 <CAGwozwHCnHwOVw08ZJ4LOFD8kDv+kevvF1-PkjBq2+VMBBx9TQ@mail.gmail.com>
 <52B61B78-4177-474B-9D40-471ED918C951@ljones.dev>
 <CAGwozwGJUPQLB2UrZubUj9Sd-MijM0ADepVwEaNo6MNRafD=Gg@mail.gmail.com>
 <4A46B714-E4D8-43B3-A4F0-53FF76E41BE4@ljones.dev>
In-Reply-To: <4A46B714-E4D8-43B3-A4F0-53FF76E41BE4@ljones.dev>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Mon, 3 Nov 2025 10:15:46 +0100
X-Gmail-Original-Message-ID: 
 <CAGwozwFfQdivRkb3uSQOOZa6chRAiQjuHTSBGLxyr1JqJ=zVFA@mail.gmail.com>
X-Gm-Features: AWmQ_bkwrcVG8jLI4oZzN0XUVjNqpsC0QFntEyYOPMRU6Mo2BXO46oyvrDfwpoQ
Message-ID: 
 <CAGwozwFfQdivRkb3uSQOOZa6chRAiQjuHTSBGLxyr1JqJ=zVFA@mail.gmail.com>
Subject: Re: [PATCH v7 5/9] platform/x86: asus-wmi: Add support for multiple
 kbd led handlers
To: luke@ljones.dev
Cc: "Derek J. Clark" <derekjohn.clark@gmail.com>,
 Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
 Corentin Chary <corentin.chary@gmail.com>,
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Denis Benato <benato.denis96@gmail.com>, kernel test robot <lkp@intel.com>,
	platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org,
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-PPP-Message-ID: 
 <176216135872.1165019.5911887596793356627@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.3 at linux3247.grserver.gr
X-Virus-Status: Clean

On Mon, 3 Nov 2025 at 10:06, <luke@ljones.dev> wrote:
>
>
>
> > On 3 Nov 2025, at 21:48, Antheas Kapenekakis <lkml@antheas.dev> wrote:
> >
> > On Mon, 3 Nov 2025 at 09:38, <luke@ljones.dev> wrote:
> >>
> >>
> >>> On 3 Nov 2025, at 20:36, Antheas Kapenekakis <lkml@antheas.dev> wrote=
:
> >>>
> >>> On Mon, 3 Nov 2025 at 05:29, Derek J. Clark <derekjohn.clark@gmail.co=
m> wrote:
> >>>>
> >>>>> On Fri, 31 Oct 2025 at 09:27, Jiri Kosina <jikos@kernel.org> wrote:
> >>>>>>
> >>>>>> On Thu, 23 Oct 2025, Antheas Kapenekakis wrote:
> >>>>>>
> >>>>>>>> 1589
> >>>>>>>> 1590  static void kbd_led_update_all(struct work_struct *work)
> >>>>>>>> 1591  {
> >>>>>>>> 1592          enum led_brightness value;
> >>>>>>>> 1593          struct asus_wmi *asus;
> >>>>>>>> 1594          bool registered, notify;
> >>>>>>>> 1595          int ret;
> >>>>>>>                             /\ value should have been an int and
> >>>>>>> placed here. It can take the value -1 hence the check
> >>>>>>
> >>>>>> Thanks, that needs to be fixed before the final merge.
> >>>>>>
> >>>>>>> Are there any other comments on the series?
> >>>>>>>
> >>>>>>> The only issue I am aware of is that Denis identified a bug in as=
usd
> >>>>>>> (asusctl userspace program daemon) in certain Asus G14/G16 laptop=
s
> >>>>>>> that cause laptop keys to become sticky, I have had users also re=
port
> >>>>>>> that bug in previous versions of the series. WIthout asusd runnin=
g,
> >>>>>>> keyboards work fine incl. with brightness control (did not work
> >>>>>>> before). Given it will take two months for this to reach mainline=
, I
> >>>>>>> think it is a fair amount of time to address the bug.
> >>>>>>
> >>>>>> One thing that is not clear to me about this -- is this causing a =
visible
> >>>>>> user-space behavior regression before vs. after the patchset with =
asusctl?
> >>>>>>
> >>>>>> If so, I am afraid this needs to be root-caused and fixed before t=
he set
> >>>>>> can be considered for inclusion.
> >>>>
> >>>>> Commit 591ba2074337 ("HID: asus: prevent binding to all HID devices=
 on
> >>>>> ROG") adds HID_QUIRK_INPUT_PER_APP and the extra devices seem to
> >>>>> confuse asusd. Since the devices are the same as with hid-asus not
> >>>>> loaded, it is specific to that program.
> >>>>>
> >>>>>
> >>>> Hi Antheas.
> >>>>
> >>>> While you have previously expressed to me directly that you wish Inp=
utPlumber
> >>>> didn't exist, it still very much does, in fact, exist. I also know t=
hat you are
> >>>> explicitly aware that InputPlumber is a consumer of this interface, =
so your
> >>>> comment that asusctl is the only affected program is something you k=
now to be
> >>>> false. This is not even the first time you have renamed an input dev=
ice that
> >>>> you knew InputPlumber was a consumer of without notifying me[1].
> >>>>
> >>>> I can't abide you outright lying to the maintainers here and I'm sic=
k and tired
> >>>> of having to watch your every move on the LKML. Either become a good=
 citizen of
> >>>> kernel maintenance, or get out of it.
> >>>
> >>> Hi Derek,
> >>> I am not aware if your software is affected or not by this series as =
I
> >>> have not received reports about it.
> >>>
> >>> If it is, please add:
> >>> "ASUSTeK Computer Inc. N-KEY Device"
> >>>
> >>> As a name match to your software (should only take 5 minutes).
> >>>
> >>> I worked with Luke and Dennis on it for the better part of a year so
> >>> hopefully they forwarded to you if it affects you or not.
> >>>
> >>> Your software relies on OOT drivers for most devices incl. the Ally s=
o
> >>> I am unsure if it is affected in reality. E.g., it would not be
> >>> affected in SteamOS and CachyOS. In the future, it would be good to
> >>> avoid name matches for your software as it makes it very fragile,
> >>> which is a discussion we have had before. I do not think device evdev
> >>> names constitute an ABI technically.
> >>
> >> Taking no sides here.
> >>
> >> An unfortunate reality is that there is stuff out there that does use =
name matches (and yes I agree they shouldn=E2=80=99t because it is *not* an=
 ABI and many many devices have had name changes over the decades).
> >>
> >> While name strings aren't a formal ABI, when a change affects known do=
wnstream users, a heads-up helps the ecosystem adapt smoothly=E2=80=94even =
if the technical stance is that they shouldn't rely on names.
> >>
> >> In general it also needs to be justified such as:
> >> - "Matches updated product branding"
> >> - "Current string is misleading (says 'mouse' but it's a keyboard)"
> >> - "Fixing spelling error"
> >> - "Aligning with USB-IF device class names"
> >>
> >> I always advocated use of evdev libraries to discover devices rather t=
han the shortcut of name matching as it is much more powerful and reliable =
(which is how asusctl does dynamic add/remove of LED dev dbus interfaces). =
It=E2=80=99s much better to use evdev with vid/pid, device sub/classes, int=
o descriptors and so on - you can be as open or restrictive as required by =
use case. This particular issue illustrates why this approach is preferable=
.
> >>
> >> If the name change is a result of something I said or missed then I ap=
ologise to both Derek and yourself. Likely I missed it as I=E2=80=99ve neve=
r relied on name strings for userspace.
> >>
> >> Regarding the OOT ally drivers I started, these will of course get ups=
treamed in the future (by Denis in this case when he can). They are getting=
 very heavily battled tested in the mean time. Please do contribute to them=
 if there is anything required to be addressed or chat to Denis, after all =
they are made only to benefit all users (there is no *race to be first* her=
e.
> >>
> >> As I no longer work on Asus laptops/handhelds and don't have hardware =
left to test with, I can't contribute further to this discussion. Best of l=
uck resolving this.
> >>
> >> I'm out.
> >> Luke.
> >
> > Hi Luke,
> > good luck to your future endeavors.
> >
> > The OOT reference was not to disparage the drivers, just to note that
> > in kernels that use those, hid-asus is stubbed for the Ally so there
> > is no change there.
> >
> > As for reasons, see below.
> >
> >> - "Matches updated product branding"
> >
> > Reason for [1]
> >
> >> - "Aligning with USB-IF device class names"
> >
> > Reason for the change in this patch
>
> Ack. Thank you, appreciate the clarification, this is the appropriate rea=
son. Might be worth mentioning in change cover letter or commit message (if=
 not already, sorry if I missed).
>
> >
> > If you would like me to stop cc'ing you in future asus changes let me
> > know. I am preparing some additional patches for the Duo class of
> > laptops.
>
> Leave me in for the moment. I=E2=80=99ll submit a patch to remove myself =
from maintainers once Denis is comfortable in the role.
>
> Regarding Duo, I assume you mean the larger type with two full-size scree=
ns and not the older models with a thin screen above the keyboard?
> There was an issue with the older ones which I could not solve until I ha=
d the physical hardware to test due to it being difficult for testers to de=
scribe the exact behaviour. The way the power-off and brightness control wo=
rks is funky. I submitted the patch here https://lore.kernel.org/all/202505=
25204214.104030-1-luke@ljones.dev/
>
> Hopefully that=E2=80=99s of some help to you. It=E2=80=99s very unlikely =
I will resubmit that as a split series.
>
> If you need anything from me related to above or otherwise, do please rea=
ch out off-chain to avoid us further hitting the CC.

Yes, the two screen type. I am focusing on the keyboard for now. I am
waiting for a user to test the changes. This series helps with
maintaining keyboard brightness on that. Hopefully it will work as the
keyboard transitions from USB to bluetooth.

If there are issues with the screen brightness, I will rereview your
patch and if it is needed adapt it and coby you.

Best,
Antheas

> >
> > Best,
> > Antheas
> >
> >>>
> >>> Best,
> >>> Antheas
> >>>
> >>>> Commit 591ba2074337 ("HID: asus: prevent binding to all HID devices =
on ROG")
> >>>> Nacked-By: Derek J. Clark <derekjohn.clark@gmail.com>
> >>>>
> >>>> - Derek
> >>>>
> >>>> [1] https://lore.kernel.org/linux-input/Z74vZD7ZtKBTDlwy@google.com/
> >>>>
> >>>>> We can delay that patch until Denis who took over maintenance of th=
e
> >>>>> program can have a deeper look. I will still keep the last part of
> >>>>> that patch that skips the input check, because that causes errors i=
n
> >>>>> devices that do not create an input device (e.g., lightbar).
> >>>>>
> >>>>> Antheas
>
>
>

