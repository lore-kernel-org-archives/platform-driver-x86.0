Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795467606;
	b=x/0SqibpnXooPkJ5QQqkbLeXiUN1oCqydfkfFh4bV4rCInov/C136PZVPa5IjocPMJiu
	 O8F5VSjkagE3hD8nOyJQ2SISvl1w3PVlNZUvL/O6NBMm7XRF5ZRVoc/sM4oKq0AjmeBUa
	 MpbLmTdcZ+auWcaiI7c7PMeIiQN/wbtwAsJ0NOTpAOAbQYrqpSeFs6B7TQ2o79Zq+ZXBf
	 zdFIT81W5AH8/xz1e82YCz0FnYyp10W0TMAA7/EQ6p/Fd075Ak6sqywR1m4HZvFTc0XPG
	 ofL18///+KTizBw6CMKudNwpjBcEAht96YIRVhRM8yPZX5oIU6uNw/k0GolHv2Whzsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795467606;
	h=Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To:User-Agent;
	bh=sH8uw1zQbkKfoZM8eDhcpr5I9ieG2zs6ZWckZtWuoOo=;
	b=f7fro0Eq2aAIADFnDC4dVgM2FGB1OnnZ3wW5nFrI0rXt3woGXV6Mav/tuqDcw6AeLD0G
	 9cAELVmFY1Nq/OMObv81sr+ZpM0dp0Rga+tLi55eIhL4VlT/yWTi6dqIC8SKjQik/dkic
	 dzuLyP2Tj1/VKYJrPkRyMwf/lJJ32LGgjn3t2MIeKVO7u5MgURMgjt3MqOzfpdiVJ4gH8
	 FjtqFj4/2aR0u6XWFpaiRgLj1xTUbJA24l7dznjaj32ACw+rxrjGgHh+afCva4Rse3JnB
	 DMQji515OcXtq6D7L7Cl1jd8g4PHP7eGAO+UVovXTPIdDDB0TfxbNj3lwaG+la/60OQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=f0vxlCYl;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C32F606A32A;
	Mon, 23 Nov 2026 21:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=f0vxlCYl
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D6691F000D0;
	Mon, 23 Nov 2026 21:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795467605;
	bh=sH8uw1zQbkKfoZM8eDhcpr5I9ieG2zs6ZWckZtWuoOo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=f0vxlCYlPQT//eNpS6KVzxhI1dwaGnIpWYoNwWgAoj4st0vR9LelbHDvyVH3pwTLH
	 0sXPMfWI8vkF1oAdwX1ebaxhO76fQWmCLSwqYjTZ6FdRXHi8cE4uD1+iqaKPvtwoBN
	 CAkKYRQSIzpFgBbuC624CASyHAw9zRXFJMNrHiISL7tE4/9O2PD7rPO190LI7c6aWY
	 MraMFEygy0MXsToazZjUYwnA+vUvDUXsEnaBTR6nJcvip73TJ+89wyZBAHNdV/aZaD
	 sTFeTs5zC5Z8g0EnSyvyAki6/OEhqjsu0Wy3hRtnDsoe86GFI6nDEYu76jju+fXbem
	 LwSWKh2Q0YQqw==
Received: by pali.im (Postfix)
	id 70545787; Mon, 23 Nov 2026 22:00:02 +0100 (CET)
Date: Mon, 23 Nov 2026 22:00:02 +0100
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Brian Mak <bmak@nvidia.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
	Kurt Borja <kuurtb@gmail.com>,
	Stuart Hayes <stuart.w.hayes@gmail.com>,
	Matthew Garrett <mjg59@srcf.ucam.org>,
	Lyndon Sanche <lsanche@lyndeno.ca>, Armin Wolf <W_Armin@gmx.de>,
	Prasanth Ksr <prasanth.ksr@dell.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	"platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
	"Dell.Client.Kernel@dell.com" <Dell.Client.Kernel@dell.com>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 4/8] platform: dell: Allow DELL_LAPTOP to be
 arch-independent
Message-ID: <20261123210002.baki6f34ww7azjob@pali>
References: <20261121000556.173028-1-bmak@nvidia.com>
 <20261121000556.173028-5-bmak@nvidia.com>
 <20261121004828.rk2k2cq4id2ixkal@pali>
 <af13cde2-6407-453d-81db-1778b30f4763@nvidia.com>
 <20261123193923.cl2i62lgute6li3u@pali>
 <58afee6c-52fd-49af-b8d2-b0569051f5e3@nvidia.com>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <58afee6c-52fd-49af-b8d2-b0569051f5e3@nvidia.com>
User-Agent: NeoMutt/20180716

On Monday 23 November 2026 20:33:11 Brian Mak wrote:
> On 11/23/26 11:39, Pali Rohár wrote:
> > On Monday 23 November 2026 19:11:00 Brian Mak wrote:
> >> On 11/20/26 16:48, Pali Rohár wrote:
> >>> On Friday 20 November 2026 16:05:50 Brian Mak wrote:
> >>>> CONFIG_DELL_LAPTOP is currently not available on ARM64, due to a
> >>>> dependency on CONFIG_SERIO_I8042. This dependency is actually not
> >>>> necessary, as there is a fallback. Make it optional.
> >>>
> >>> i8042 is used for controlling touchpad LED and for receiving rfkill
> >>> events when the dell-rbtn is not supported on the particular machine.
> >>>
> >>> Touchpad led is available on more Vostro and Inspirion machines and
> >>> there is no fallback or detection of i8042 at all. Even there is no
> >>> error checking.
> >>>
> >>> And for receiving rfkill events it is same situation.
> >>>
> >>> So the dell-laptop driver expects that the SERIO_I8042 is enabled and
> >>> compiled in.
> >>>
> >>> If none of these functionality is available on arm64 HW, then it makes
> >>> sense to make the SERIO_I8042 only for x86. And then in the dell-laptop
> >>> driver marking the x86 specific dependency via ifdefs. Which allows to
> >>> compile driver on arm64 without those specific functionalities.
> >>
> >> SERIO_I8042 already can't be enabled on arm64,
> > 
> > That makes sense. i8042 is x86 specific.
> > 
> >> as ARCH_MIGHT_HAVE_PC_SERIO is not set. With the current patch, the driver
> >> builds on arm64, but as you mentioned, there's a couple gaps that need
> >> to be addressed with rfkill and touchpad LED.
> >>
> >> For rfkill currently, the driver fails to probe, due to a failed
> >> i8042_install_filter call, if the device is a Latitude or a Precision
> >> (checked by DMI) or force_rfkill is enabled, SMBIOS reports an rfkill
> >> switch, and dell-rbtn is not supported. That doesn't apply for the XPS
> >> 16 Creator Edition, but it may for an ARM64 Latitude or Precision
> >> product. For v2, if dell-rbtn and i8042 are both unavailable, I can make
> >> rfkill setup fail without failing probe.
> > 
> > Well, here the main point is: who (from HW point of view) will report
> > the rfkill event? It cannot be i8042 because this controller is not
> > present on arm64. My guess is that dell-rbtn interface is also not
> > present as I was told that Dell abandoned this interface even on x86.
> > 
> > So for arm64 platform there has to be some other source of rfkill
> > events. Or rfkill is not provided at all.
> > 
> > I do not know... because I do not have this hardware. So this question
> > is for somebody who is writing drivers for this platform...
> 
> I see your point. I wasn't aware of the history with how dell-rbtn was 
> abandoned.

Well, do not take my words for 100% percent. I just recall that somebody
told me it. So maybe I do not know it correctly. (Too many things are
right now out of my head)

> The dell-rbtn interface is not present on my XPS 16 Creator 
> Edition either. There isn't an rfkill interface on this platform, to my 
> knowledge. When I suggested to make rfkill setup fail without failing 
> probe, that was for in case the dell-rbtn interface is available on a 
> future platform. Since you said that it's abandoned, I would agree that 
> there's no possible sources for rfkill events on ARM64 Dell platforms.
> 
> I can gate rfkill setup logic behind an ifdef as well then, for v2. Is 
> your preference to gate behind SERIO_I8042 or X86?

The i8042 and dell-rbtn are two event reports. These "HW" parts are
sending events to kernel when the hard rfkill state changes. On some
laptops it is i8042 on another it is dell-rbtn and on some both.
Obviously it is enough to get just one event that hard rfkill state was
changed (the driver will re-read state and inform listeners).

But to provide kernel events to listeners, it is needed to have
something which will report it to kernel. And in case there is hard
rfkill on arm64 there would be also some interrupt mechanism which will
report it. I'm just guessing, this is something which Dell or laptop
platform people would know.

So right now, when the driver is moving out of the x86 subdir, gating
i8042 logic should be behind the SERIO_I8042.

In my opinion there would be some interrupt / event mechanism also on
arm64 products (if not now then maybe in some later products), so the
code would be revisited in future.

> > In any case, it does not make any sense to provide "fake" or "dummy"
> > device by linux just to make driver compilable.
> 
> I'm not sure I understand what you mean by this. Under my original 
> proposal of making rfkill setup fail without failing probe, no dummy or 
> non-functional devices would be exposed by the driver. rfkill setup 
> would fail gracefully, and the rfkill devices would go away with it. I 
> agree with you, but I'm not sure if I'm missing something here.

Ok, if rfkill devices go away then it is fine. I was not fully sure
about it.

Now I see that I forgot lot of logic behind those dell drivers, so I
would need to re-read it again.

> >> For the touchpad LED currently, the i8042_command() stub will return
> >> -ENODEV and do nothing. This will register an LED that does nothing. For
> >> v2, I can gate the LED registration behind a SERIO_I8042 ifdef.
> > 
> > I think that this is correct way. The i8042 touchpad led should not be
> > enabled when the i8042 HW is not present at all. And that touchpad led
> > is only for few models based on whitelist.
> > 
> >> For the Kconfig, since i8042 is required on some x86 Dell platforms, I
> >> can change the Kconfig dependency to be like such, to ensure that
> >> SERIO_I8042 is required on x86 and optional elsewhere (in case there's
> >> another arch introduced by Dell that supports i8042 in the future):
> >>
> >> depends on SERIO_I8042 || (SERIO_I8042 = n && !X86)
> >>
> >> Please let me know if these changes are good with you.
> >>
> >> Thanks,
> >> Brian
> > 
> > My personal opinion is to make i8042 dependency only on x86. And do not
> > even try to enable i8042 on non-x86 platforms. All dell drivers were in
> > x86 subdirectory which cause that explicit x86 was not written in
> > Kconfig (as it was not needed).
> > 
> > Now when you are moving dell drivers out of the x86 subdir, maybe it
> > could make sense to check if there are some other config options which
> > have also hidden dependency on x86.
> > 
> > Anyway, I highly doubt that any new platform / device (which is designed
> > from scratch; not rebranded or evoluted) would use i8042 for any such
> > API. Nowadays all those functionalities are based on ACPI or WMI APIs.
> 
> If I understand your suggestion correctly, you are asking, instead of 
> gating behind:
> 
> depends on SERIO_I8042 || (SERIO_I8042 = n && !X86)
> 
> You would gate behind:
> 
> depends on SERIO_I8042 || !X86
> 
> Thanks,
> Brian

Ufff... some more complicated logic behind.

Let me think... If you extend the driver to compile touchpad led support
conditionally based on CONFIG_SERIO_I8042 and same for that rfkill event
reported, then it should be enough to write just:

depends on SERIO_I8042 || SERIO_I8042 = n

After those changes if somebody compiles kernel without the SERIO_I8042
support (e.g. because uses only USB keywords) then would be able to use
dell drivers on laptops without touchpad led and without rfkill. (I
guess there are many such laptops).

And at the same time it will solve also your problem with arm64. And do
not need to think about "|| !X86" part at all.

It is correct, or did I some mistake here?

(I'm trying to simplify that logic and setup.)
