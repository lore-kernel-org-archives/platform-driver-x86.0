Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A8E1440A30;
	Fri,  9 Oct 2026 10:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791540188; cv=none; b=Z58x+fHYw9vIwBU6H0ES/IfLCKIZcW/3HYNFff8rZNEMZot5cGnkopaesgPRBs6/GnlN7HuNopXIb1D+qByr5Ryjc7w4eiTeaT3L7P/sq1yLWhcnSz2klqAX1rFSC3ewa+7pfX5pWPDVjYE1cun5krNvsZJ0f0kVQka5rkyRuAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791540188; c=relaxed/simple;
	bh=D0i5di1iMdSbKAQfvTyv9tvrThAkd7snZOuoxY+DxIo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DSjHgo50K42A32fF8Psm27qEgjp/1b/ynrovjcJVnnfkK18lgyt981O8dv+ib8yyt1KeYAUlaN+lPC06ksXmXvcVtxW2ON4lAqjdTkuWQO94oF6KF26y6rhJSVUQMP5YTB+sfROJjjc9V2lW/M4wYMcXI/LXzlZYAkfMXP58bb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=GfuLRJU/; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="GfuLRJU/"
Received: from [192.168.0.43] (chfd-03-b2-v4wan-176392-cust229.vm15.cable.virginm.net [82.19.20.230])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id DCAD5D77;
	Fri,  9 Oct 2026 12:01:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1791540065;
	bh=D0i5di1iMdSbKAQfvTyv9tvrThAkd7snZOuoxY+DxIo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=GfuLRJU/wh9ozzrqijrFvYJaL3B44dJWyC4zkvZ9DdEnaXriPweqiZ6Nce81Xepqe
	 i7QWSy5VHpmp+2+0SwK0EU0YNyC32MRom8d32Z3TMbw4VvzRIqt4bi6YB4rmFDLWsb
	 KuoycRTNtNp9Vv/zfVFAhPvWhAWiqqvqzudoMeWA=
Message-ID: <d9a37aff-3b4d-467c-825d-5473b4c1bbb4@ideasonboard.com>
Date: Fri, 9 Oct 2026 11:03:00 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: int3472: GPIO type names disagree with Intel's Windows driver
To: Alexander Patrakov <patrakov@gmail.com>, Hans de Goede
 <hansg@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 Leif Skunberg <diamondback@cohunt.app>, Sahan Nissanka <adee.sahan@gmail.com>
References: <CAN_LGv0qkxARw4bxO8K-1hUkWNg2ts6q50dooCB5UM5en=bo0w@mail.gmail.com>
Content-Language: en-US
From: Dan Scally <dan.scally@ideasonboard.com>
In-Reply-To: <CAN_LGv0qkxARw4bxO8K-1hUkWNg2ts6q50dooCB5UM5en=bo0w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Good morning Alexander

On 09/10/2026 04:06, Alexander Patrakov wrote:
> Hi,
> 
> Disclosure: I used Claude Code for the table extraction, for the Windows
> driver disassembly, and for drafting this email.
> 
> This is a report, not a patch. While I was getting the front camera of a
> Lenovo Yoga Duet 7 13ITL6 to work, Claude Code found that Intel's Windows
> control logic driver carries a table of names for the INT3472 _DSM GPIO
> types. It names three types that matter for discrete-INT3472 designs, one
> of which Linux already handles under a different name. I do not see a
> clean way to turn that into a patch, so I would like to put the facts in
> front of you and ask how you want them handled.
> 
> The table
> ---------
> 
> iactrllogic64.sys holds an array of 22 pointers to GPIO function names.
> Index and name:
> 
>    0x00 Reset       0x08 Power1         0x10 Avdd
>    0x01 Enable      0x09 Standby        0x11 Core
>    0x02 Strobe      0x0a WriteProtect   0x12 Handshake
>    0x03 Torch       0x0b PowerEn        0x13 HDMI_INT_IO
>    0x04 Flash       0x0c Mclk           0x14 HDMIDetect
>    0x05 LedRear     0x0d PrivateLED     0x15 Reserved
>    0x06 LedFront    0x0e AF
>    0x07 Power0      0x0f IO
> 
> Every type drivers/platform/x86/intel/int3472/discrete.c handles today
> sits under a matching name at its own index: reset, strobe, power enable,
> clock enable, privacy LED, handshake, hotplug detect. That is why I take
> the index to be the _DSM type.
> 
> The same table is in two builds:
> 
>    DriverVer 08/23/2021,60.22000.0.11   shipped for the Yoga Duet 7 13ITL6
>      sha256 28b0ce9cfabc2bd6b1cd11d3bfbffa792f0fab785dc52fcaf21b9f7e100982f8
>    DriverVer 07/20/2023,63.22000.3.13186  shipped for the ThinkPad X1 Fold
>      16 Gen 1, in Lenovo's camera package n3lce16w.exe
>      sha256 fd1db239a9a48671f571080fb5d6c068c50f2196f807ef20cbe6fdbf12f40455
> 
> The Yoga driver came with the tablet.
> 
> The ThinkPad driver was downloaded from
> https://pcsupport.lenovo.com/us/en/products/laptops-and-netbooks/thinkpad-x-series-laptops/thinkpad-x1-fold-16-gen-1-type-21es-21et/downloads/driver-list/component?name=Camera%20and%20Card%20Reader&id=B7FF933A-6722-4635-9471-39DF68737A1D
> 
> How to reproduce
> ----------------
> 
> 1. Lenovo's packages are Inno Setup installers that can be extracted on Linux:
> 
>       innoextract n3lce16w.exe
>       # -> code$GetExtractPath$/x64/iactrllogic64.sys
> 
> 2. The names are plain ASCII, stored one after another in this order.
>     "AF" and "IO" are two characters long, so ask strings for short ones:
> 
>       strings -n 2 iactrllogic64.sys | grep -x -B13 -A8 PrivateLED
> 
>     (In the 2023 build "Reset" shows as "wZReset": two stray bytes sit
>     directly in front of it.)
> 
> 3. That the order is an index and not an accident of layout shows in the
>     pointer array: 22 consecutive 64-bit pointers (image base 0x140000000)
>     to those strings, at file offset 0x21060 in the 2021 build and 0x21c60
>     in the 2023 build. The script at the end of this mail finds the array
>     and prints it.
> 
> What this says about Linux
> --------------------------
> 
> Read as rails, the three are:
> 
>    0x0f IO     digital I/O supply    (dovdd)
>    0x10 Avdd   analog supply         (avdd)
>    0x11 Core   digital core supply   (dvdd)
> 
> The Yoga Duet 7 has exactly these three behind its INT3472, next to a
> reset and a privacy LED pin: 0x0f on pin 322, 0x10 on pin 321 and 0x11 on
> pin 332. Linux handles 0x10 and warns about the other two, so the sensor
> never gets all of its supplies.
> 
> Linux calls 0x10 DOVDD. That comes from commit 2a7b7652b1bb
> ("platform/x86: int3472: Handle GPIO type 0x10 (DOVDD)"), added for the
> ThinkPad X1 Fold 16 Gen 1. Neither the commit nor its review says how the
> meaning was established, and Intel's driver for that same machine has it
> as Avdd. Leif, do you remember what it was based on, and which other GPIO
> types that machine's INT3472 reports?
> 
> As far as I can tell the name has done no harm. Each such GPIO becomes a
> regulator that supplies the sensor under the chosen name; sensor drivers
> ask for all of their supplies and enable them together (ov5675 does a
> regulator_bulk_enable() over avdd, dovdd and dvdd); and a supply that
> nothing provides resolves to a dummy regulator on ACPI systems. So the
> GPIO is switched at the same moment whichever of the three names it
> carries. It would only matter to a driver that sequences its supplies or
> does not ask for the name the GPIO was given.
> 
> Two more names look wrong against the table. Linux gives type 0x0b the
> supply name avdd and type 0x12 the supply name dvdd. Intel calls them
> PowerEn and Handshake, a general enable and a handshake signal, neither
> of them tied to a rail; the names avdd and dvdd belong to 0x10 and 0x11.
> I would treat those two as misnamed as well. They have worked for the
> same reason as above.

Indeed, much of the reverse-engineering here was a bit of best-effort. We were fairly sure those 
GPIO lines represented power and their drivers were looking for supplies with particular names, so 
those were the names we used without necessarily understanding which was which.
> 
> Why I am not sending a patch
> ----------------------------
> 
> Giving 0x0f, 0x10 and 0x11 their proper names, while 0x0b and 0x12 keep
> the ones they have, means two names end up on two types each:
> 
>    avdd   0x0b (PowerEn) and 0x10 (Avdd)
>    dvdd   0x11 (Core) and 0x12 (Handshake)
> 
> A system whose INT3472 declares both members of a pair for one sensor
> would ask for two regulators supplying the same name, and the second
> regulator_register() fails with -EBUSY. No type shares a default name
> with another in mainline today. I do not know whether such a system
> exists; Intel's 2021 build handles Core and Handshake as separate steps,
> so the firmware vocabulary at least allows it.
> 
> The ov5675 driver asks for avdd, dovdd and dvdd, and all three are
> already the default names of 0x0b, 0x10 and 0x12. So I see no way to add
> 0x0f and 0x11 as general types without reusing a name, whatever is done
> about 0x10.

Does the situation need amending? The handshake pin being modelled as a regulator named dvdd is a 
deliberate situation; see Hans' commit message in c5d0393272048 ("platform/x86: int3472: Add 
handshake pin support") for the explanation. I would think the same applies for PowerEnable (though 
I suppose it could also be legitimately modeled as a GPIO, but sensor driver handling of those is 
less consistent).

Is there some sensor case you're aware of that's not working because of this problem?

Thanks
Dan

> 
> For the Lenovo Yoga Duet 7 13ITL6 tablet the three GPIOs do power the
> sensor with a local copy of the driver that maps 0x0f and 0x11 to the two
> names 0x10 does not use, for this model only. The sensor is an OVTI5678,
> the RGB-IR variant of the OV5675 that Sahan's Dell Latitude 7320
> Detachable series is about:
> 
>    https://lore.kernel.org/linux-media/20260809042540.15849-1-adee.sahan@gmail.com/
> 
> Its sensor-side patches are on hold over the ability to describe the 4x4
> RGB-IR sensor pattern, so there is no in-tree user for these types yet
> either.
> 
> Windows driver logic
> --------------------
> 
> Claude Code says the following about what the Windows driver does with
> these types, and I have not verified it. It comes from reading a
> disassembly (objdump -d -M intel iactrllogic64.sys) of the power-on
> routine, which can be found through its trace string,
> "discrete::DiscreteControl::SensorOn".
> 
>    2023 build (X1 Fold): switches Enable, Power0, Power1, PowerEn and
>    Avdd (0x10) in that order, then handles the handshake, Reset and Mclk,
>    with waits of 2 to 5 ms between steps. It does not touch 0x0e, 0x0f or
>    0x11 anywhere.
> 
>    2021 build (Yoga Duet 7): switches Mclk and Reset, then Avdd (0x10),
>    Core (0x11), IO (0x0f) and AF (0x0e) back to back, waits 2 ms, then
>    Reset again and Handshake. The power-off routine switches the same
>    four off together.
> 
> If that is right, both builds treat 0x10 as a supply and the older one
> treats 0x0f and 0x11 the same way.
> 
> Question
> --------
> 
> How should this proceed, given the misnamed GPIO types in Linux and the
> name conflicts that would follow from attempts to fix them?
> 
> Thanks,
> Alexander Patrakov
> 
> ---- int3472-gpio-names.py ----
> #!/usr/bin/env python3
> """Print the GPIO function name table of Intel's iactrllogic64.sys.
> 
>      int3472-gpio-names.py iactrllogic64.sys
> 
> The driver has an array of pointers to short names ("Reset", "Enable", ...).
> This finds the array by looking for a pointer to "Reset" followed by a pointer
> to "Enable", and prints every name with its index.
> """
> import struct, sys
> 
> d = open(sys.argv[1], 'rb').read()
> pe = struct.unpack_from('<I', d, 0x3c)[0]
> nsec, optsize = struct.unpack_from('<H', d, pe + 6)[0],
> struct.unpack_from('<H', d, pe + 20)[0]
> base = struct.unpack_from('<Q', d, pe + 24 + 24)[0]            #
> ImageBase of a PE32+ file
> secs = [struct.unpack_from('<IIII', d, pe + 24 + optsize + 40 * i + 8)
> for i in range(nsec)]
> 
> def name_at(va):
>      """The string a virtual address points to, if it is a short
> printable one."""
>      for vsize, rva, rawsize, raw in secs:
>          if base + rva <= va < base + rva + max(vsize, rawsize):
>              off = raw + va - base - rva
>              end = d.find(b'\0', off)
>              s = d[off:end]
>              return s.decode() if 1 < len(s) < 24 and all(32 <= c < 127
> for c in s) else None
> 
> for off in range(0, len(d) - 16, 8):
>      if name_at(struct.unpack_from('<Q', d, off)[0]) == 'Reset' and \
>         name_at(struct.unpack_from('<Q', d, off + 8)[0]) == 'Enable':
>          print('pointer table at file offset 0x%x' % off)
>          i = 0
>          while (n := name_at(struct.unpack_from('<Q', d, off + 8 *
> i)[0])) is not None:
>              print('  0x%02x  %s' % (i, n))
>              i += 1
>          break
> else:
>      print('no table found')

