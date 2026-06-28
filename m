Received: from out-184.mta0.migadu.com (out-184.mta0.migadu.com [91.218.175.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D47C1B3925
	for <platform-driver-x86@vger.kernel.org>; Sun, 28 Jun 2026 13:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782653625; cv=none; b=m86Ih9ZTjzcSp+BEIYqSvg7XpCdZtFijA9eK59oX1Ua0p6s3/F2w5spWe/9mxUoZOJEile9OHtxJZCJGwOKtj0NPKAVuv3BgbZ77i4nDIThZPx36EN1S3cIUElIroChregOnKMMVbHtbUDYwGHGAIB8fpJd4hq3TxC9zDrMKVKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782653625; c=relaxed/simple;
	bh=9nuzGLVWguEC2DamBNsR3nCzs9MaFwWFW59It73HJfk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W2Pbmd8C6fDEZuOuG3aqCdU+33XYx/op9EEMdqyluImCU4KGNMfSDMNKBHt8Yy4bXMxNwM/gIaVsTa2dPSCQI0BG5V2E7wcGEaHhldZVixoqrzRxGq0C/HDeOXQw08HVRNz83ljLGAfM2FEUbbJgute2Ayn579Vx5S9+s3DnzDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=czyUNaVK; arc=none smtp.client-ip=91.218.175.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="czyUNaVK"
Message-ID: <79787895-204f-4329-82dc-fada89c2ffa6@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1782653620;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9nuzGLVWguEC2DamBNsR3nCzs9MaFwWFW59It73HJfk=;
	b=czyUNaVKm1qRZWHPws6kbxX65ScPl2Qe7j2fh7G+YwL7HIXH9s4VYvUKS2NkG4LUlo0Nxp
	wAaZ+XGfsq4MkSC6iA2p2xrU46OZWKQdo7KS7jvgX6d+8wKTM3MA6nuDf/WZxNiNcolQLy
	XyPX9b521z1j7FCqsrOysN2cxmymqC4=
Date: Sun, 28 Jun 2026 15:33:37 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [REGRESSION] platform/x86: asus-wmi: charge_control_end_threshold
 returns -ENODATA at boot, breaking UPower/GNOME detection
To: Travers Biddle <traversbiddle@gmail.com>, corentin.chary@gmail.com,
 luke@ljones.dev, hansg@kernel.org, ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 regressions@lists.linux.dev
References: <CABsFS_g+V_Owum6knLhenhM15EXJRrsF0FcLiw30WZxarsTpUA@mail.gmail.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Denis Benato <denis.benato@linux.dev>
In-Reply-To: <CABsFS_g+V_Owum6knLhenhM15EXJRrsF0FcLiw30WZxarsTpUA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT


On 6/28/26 08:03, Travers Biddle wrote:
> Hello,
>
> I am seeing a regression on an ASUS V16 laptop where the GNOME Settings
> "Preserve Battery Health" UI disappears after booting Linux v7.1. I reproduced
> this with a kernel built from torvalds/linux tag v7.1.
>
> I first noticed this after CachyOS updated linux-cachyos from
> 7.0.12-1 to 7.1.1-2. The same machine still works as expected with
> linux-cachyos-lts 6.18.36-1, where UPower reports charge threshold
> support and GNOME shows the Battery Charging section.
>
> The change that appears to expose this is:
>
>   186bf9031666 ("platform/x86: asus-wmi: do not enforce a battery charge threshold")
>
> #regzbot introduced: 186bf9031666602d61b40832181b6b6fdc3ba4dc
>
> Hardware:
>
>   DMI product: ASUS V16 V3607VH_V3607VH
>   Board:       V3607VH
>   BIOS:        V3607VH.303
>   Battery:     /sys/class/power_supply/BAT0
>   Battery model_name: X350052
>
> Userspace:
>
>   Distro: CachyOS / Arch Linux
>   UPower: 1.91.2
>   systemd/udev: 261
>   Desktop: GNOME Settings power panel
>
> The machine only exposes an end threshold:
>
>   /sys/class/power_supply/BAT0/charge_control_end_threshold
>
> There is no charge_control_start_threshold node on this system.
>
> On an unmodified build from torvalds/linux tag v7.1:
>
>   $ uname -r
>   7.1.0-asus-test-1
>
>   $ cat /proc/sys/kernel/tainted
>   0
>
>   $ cat /sys/class/power_supply/BAT0/charge_control_end_threshold
>   cat: /sys/class/power_supply/BAT0/charge_control_end_threshold: No data available
>
> `udevadm test /sys/class/power_supply/BAT0` does not import CHARGE_LIMIT.
> The relevant end of the properties list is:
>
>   Properties:
>     ACTION=add
>     DEVPATH=/devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/PNP0C0A:03/power_supply/BAT0
>     DEVTYPE=power_supply
>     POWER_SUPPLY_CAPACITY=81
>     POWER_SUPPLY_CAPACITY_LEVEL=Normal
>     POWER_SUPPLY_CYCLE_COUNT=26
>     POWER_SUPPLY_ENERGY_FULL=60512000
>     POWER_SUPPLY_ENERGY_FULL_DESIGN=63041000
>     POWER_SUPPLY_ENERGY_NOW=49102000
>     POWER_SUPPLY_MANUFACTURER=OEM
>     POWER_SUPPLY_MODEL_NAME=X350052
>     POWER_SUPPLY_NAME=BAT0
>     POWER_SUPPLY_POWER_NOW=25216000
>     POWER_SUPPLY_PRESENT=1
>     POWER_SUPPLY_SERIAL_NUMBER=123456789
>     POWER_SUPPLY_STATUS=Charging
>     POWER_SUPPLY_TECHNOLOGY=Unknown
>     POWER_SUPPLY_TYPE=Battery
>     POWER_SUPPLY_VOLTAGE_MIN_DESIGN=11985000
>     POWER_SUPPLY_VOLTAGE_NOW=13118000
>     SUBSYSTEM=power_supply
>
> UPower then does not expose the threshold values or threshold support:
>
>   $ upower -i /org/freedesktop/UPower/devices/battery_BAT0
>     native-path:          BAT0
>     vendor:               OEM
>     model:                X350052
>     serial:               123456789
>     power supply:         yes
>     battery
>       present:             yes
>       rechargeable:        yes
>       state:               charging
>       percentage:          81%
>       capacity:            95.9883%
>       charge-threshold-enabled:      yes
>       icon-name:          'battery-full-charging-symbolic'
>
> In this state, GNOME Settings hides the Battery Charging section entirely.
>
> I then tested a local demonstration change which does not reintroduce the
> hardware write that 186bf9031666 removed. It only keeps the cached sysfs value
> readable by initializing charge_end_threshold to 100 instead of -1.
>
> With that demonstration change applied:
>
>   $ uname -r
>   7.1.0-asus-test-2-00001-g76935ee241bc
>
>   $ cat /sys/class/power_supply/BAT0/charge_control_end_threshold
>   80
>
> `udevadm test /sys/class/power_supply/BAT0` imports the UPower hwdb limit:
>
>   BAT0: /usr/lib/udev/rules.d/60-upower-battery.rules:7 IMPORT{builtin}="hwdb 'battery:$kernel:$attr{model_name}:$attr{[dmi/id]modalias}'": Importing properties from results of builtin command "hwdb 'battery:BAT0:X350052:dmi:bvnAmericanMegatrendsInternational,LLC.:bvrV3607VH.303:bd04/29/2025:br5.27:efr3.16:svnASUSTeKCOMPUTERINC.:pnASUSV16V3607VH_V3607VH:pvr1.0:rvnASUSTeKCOMPUTERINC.:rnV3607VH:rvr1.0:cvnASUSTeKCOMPUTERINC.:ct10:cvr1.0:sku:pfaASUSV16:'".
>
>   Properties:
>     ACTION=add
>     CHARGE_LIMIT=75,80
>     DEVPATH=/devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/PNP0C0A:03/power_supply/BAT0
>     DEVTYPE=power_supply
>     POWER_SUPPLY_CAPACITY=97
>     POWER_SUPPLY_CAPACITY_LEVEL=Normal
>     POWER_SUPPLY_CYCLE_COUNT=26
>     POWER_SUPPLY_ENERGY_FULL=60512000
>     POWER_SUPPLY_ENERGY_FULL_DESIGN=63041000
>     POWER_SUPPLY_ENERGY_NOW=58414000
>     POWER_SUPPLY_MANUFACTURER=OEM
>     POWER_SUPPLY_MODEL_NAME=X350052
>     POWER_SUPPLY_NAME=BAT0
>     POWER_SUPPLY_POWER_NOW=0
>     POWER_SUPPLY_PRESENT=1
>     POWER_SUPPLY_SERIAL_NUMBER=123456789
>     POWER_SUPPLY_STATUS=Not charging
>     POWER_SUPPLY_TECHNOLOGY=Unknown
>     POWER_SUPPLY_TYPE=Battery
>     POWER_SUPPLY_VOLTAGE_MIN_DESIGN=11985000
>     POWER_SUPPLY_VOLTAGE_NOW=13026000
>     SUBSYSTEM=power_supply
>
> UPower then exposes threshold support again:
>
>   $ upower -i /org/freedesktop/UPower/devices/battery_BAT0
>     native-path:          BAT0
>     vendor:               OEM
>     model:                X350052
>     serial:               123456789
>     power supply:         yes
>     battery
>       present:             yes
>       rechargeable:        yes
>       state:               fully-charged
>       percentage:          97%
>       capacity:            95.9883%
>       charge-start-threshold:        75%
>       charge-end-threshold:          80%
>       charge-threshold-enabled:      yes
>       charge-threshold-supported:    yes
>       icon-name:          'battery-full-charged-symbolic'
>
> GNOME Settings also shows the Battery Charging section again.
>
> I am not asking for a plain revert. The part of 186bf9031666 that avoids
> writing 100 to the hardware at boot seems important, since that write can
> overwrite a charge limit retained by the firmware/platform.
>
> I am mainly reporting this so you are aware of the userspace-visible
> effect of returning -ENODATA here. On this end-threshold-only machine,
> that makes the only threshold node unreadable during UPower's discovery,
> so UPower and GNOME treat charge limiting as unsupported even though the
> kernel write path still works.
>
> It may be that UPower should handle this case differently; I have also
> filed a UPower-side issue at:
> https://gitlab.freedesktop.org/upower/upower/-/work_items/347
>
> For completeness, here is a local diff applied to v7.1 that restored
> functionality. I don't intend for it to be a final fix; only a demonstration
> that keeping the cached sysfs value readable, while still avoiding the boot-time
> hardware write, restores UPower/GNOME feature discovery on this machine.
>
> ---
> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
> index 80144c412b90..d376358b590c 100644
> --- a/drivers/platform/x86/asus-wmi.c
> +++ b/drivers/platform/x86/asus-wmi.c
> @@ -1582,11 +1582,11 @@ static int asus_wmi_battery_add(struct power_supply *battery, struct acpi_batter
>   return -ENODEV;
>  
>   /* The charge threshold is only reset when the system is power cycled,
> - * and we can't read the current threshold, however the majority of
> - * platforms retains it, therefore signal the threshold as unknown
> - * until user explicitly sets it to a new value.
> + * and we can't read the current threshold. Do not write a value to
> + * hardware here, but keep the sysfs attribute readable so userspace
> + * can discover charge threshold support and explicitly set a value.
>   */
> - charge_end_threshold = -1;
> + charge_end_threshold = 100;
>  
>   return 0;
>  }
> ---
>
> I have attached the dmesg from the reproducing v7.1 boot and the .config used
> for the build.
>
> Thanks,
> Travers
>
Hi Travers,

If you search that patch in the lkml you will see that I actually tested GNOME when I did this and I remember that I was able to change the threshold.

Moreover I also opened a discussion on Upower for this specifically (you can find in closed merge requests) https://gitlab.freedesktop.org/upower/upower/-/merge_requests but sadly right now the merge request of freedesktop is whining about undisclosed errors.

Anyway I think that either upower forgot to ship the updated rule or there is a regression in upower.

Given that setting battery to 100% would mean charging the laptop while it boots and certain people don't want this (and it's not a good practice to do that) I am not happy having to revert this change, albeit if upower doesn't solve this issue I'll probably need to.

Moreover if I remember correctly another possible workaround to have upower work is to define a fixed start_charge_threshold.

While it's possible to add it would be useless and not mapped to the hardware in any way thus simply being an hack.

Ilpo, what do we do in these cases? What's the usual procedure for these?

Regards,
Denis
