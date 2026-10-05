Received: from omr-01.pc5.atmailcloud.com (omr-01.pc5.atmailcloud.com [103.150.252.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B8327081E
	for <platform-driver-x86@vger.kernel.org>; Mon,  5 Oct 2026 11:52:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.150.252.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791201184; cv=none; b=SciiFfPDX8Vk9op5i3kgnXLR9ICH9EITrQFDaf4c0sizFPHWUM8aOyTbeXeh03yB0cuJ6NXE0P1KwWjbcGpczTgHu9ppnDyKsc8QL/ncl4Ftrh3zW9N6xOqxzoqQK42/a+iq+cbWJO1AfcKl0uAGg7KnB/meE3WCMDt9rvUjjzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791201184; c=relaxed/simple;
	bh=PPd7IPjww8LdbYcm8PORqv+HAZ+W0tQkLGHjjhGkG9I=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=dK3H+mdzEWlMV2rHTn64FytKqr57ia8QR9eEC6wGgHr1FjnR2n31CUvAExOklPuE4LTHF1PrQJJtz8ey0FasdlmYFIZgxD7HfVYJmGbJSRK3Dop4ibVLH+n4p2PEzU5H5HDeW7PMskwwNTHGUbMD+Jo4G4zJjptJ56w6/kX0ZkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ozemail.com.au; spf=pass smtp.mailfrom=ozemail.com.au; dkim=pass (2048-bit key) header.d=ozemail.com.au header.i=@ozemail.com.au header.b=K5Ic1XA0; arc=none smtp.client-ip=103.150.252.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ozemail.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ozemail.com.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ozemail.com.au header.i=@ozemail.com.au header.b="K5Ic1XA0"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ozemail.com.au; s=202309; h=Content-Type:Subject:From:To:MIME-Version:Date:
	Message-ID; bh=jXe37e4k+ovVFOdK8Nbq3JMmoOlhsVJir5LqR0E9xFk=; b=K5Ic1XA0bKS7PZ
	9t0tN+BMoaKncmNfBw0i/q+R+Ny4DLjalv/MnGUTjrdztn6JOlilJgfHYOH37Hjm9mVKn1Dh7DXqU
	fMu0jT7C85seNN3CEAw0QmwzI43QJhFncov0Yb/k5tFPLpOOY0Jeq137OUXeS3Fgv4XhxY9BDPOgf
	QxOXttrBt3T6QH8tuEgX4mtdLG2ovKOMx3hC75e5/i8tHI9uIJ684/E7YSy/0m7+Q7Q3qeJB5dXWn
	gqVPj7fbor9g/Ffv0N8LK8CjmFkzhmt1AMBNnX32P9PyqtVca5l1aZLP+4MlFhozST3bPz335lz1E
	RB0h4enSNgrlRLQ1/x7Q==;
Received: from cmr-tmc.internal.pc5.atmailcloud.com (cmr-tmc.internal.pc5.atmailcloud.com [192.168.1.2]) 
	by omr-01.pc5.atmailcloud.com (Exim/cmr-tmc.i-065d927f116c61df8) with ESMTPS
	(envelope-from <jonesy@ozemail.com.au>)
	id 1xDgsp-0000000DkCL-11e7 ;
	Mon, 05 Oct 2026 11:29:27 +0000
Received: from [103.164.128.250] (helo=[10.10.10.169])
	 by cmr-tmc.i-065d927f116c61df8 with esmtpa
	(envelope-from <jonesy@ozemail.com.au>)
	id 1xDgsn-0000000CUn4-2VHe;
	Mon, 05 Oct 2026 11:29:27 +0000
Message-ID: <027ab80d-0d00-4750-af2e-c7a72db0d0c6@ozemail.com.au>
Date: Mon, 5 Oct 2026 22:29:24 +1100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Linux)
Content-Language: en-US
To: Armin Wolf <W_Armin@gmx.de>
Cc: platform-driver-x86@vger.kernel.org
From: Luke Jones <jonesy@ozemail.com.au>
Subject: uniwill-laptop: Venom BlackBook Zero 14 Phantom (L360) - EC fan table
 findings
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Atmail-Id: jonesy@ozemail.com.au
Authentication-Results: cmr-tmc.au-east.atmailcloud.com; auth=pass smtp.auth=jonesy@ozemail.com.au
X-atmailcloud-spam-action: 
X-atmailcloud-route: unknown

Hi Armin,

I own a Venom BlackBook Zero 14 Phantom (L360), an Australian rebrand of 
a Uniwill Intel P-series board, and have been getting it working 
properly on Linux (Ubuntu 26.04, kernel 7.0). Since uniwill-laptop is 
where this belongs long-term, I wanted to share what I found in case 
it's useful, and offer to test anything on this hardware.

Hardware:
- DMI sys_vendor: Venom
- DMI product/board: Venom BlackBook Zero 14 Phantom (L360)
- DMI family: Zero Phantom
- BIOS: N.1.10VEN00 (2023-08-08), EC firmware 1.16
- CPU: i7-1360P, no dGPU
- ACPI: \_SB.INOU (INOU0000) with ECRR/ECRW; UNIW0001 touchpad
- EC 0x0740 (project ID): 0x18 (PHxPxxx); fan tables in Uniwill Control 
Center suggest PH4PGx1/PH4PGx2
- EC 0x078E: UNIVERSAL_FAN_CTRL and CHARGING_PROFILE bits set

Findings on the RAM fan table:

1. The EC ignores the custom table unless EC_ADDR_AP_OEM (0x0741) 
ENABLE_MANUAL_CTRL (bit 0) is set. With the table written and 0x07C6 bit 
2 set, but 0x0741 bit 0 clear, the fan stayed on the factory curve. 
Setting bit 0 made it follow the table within ~20 s. Uniwill's Control 
Center sets this bit while its service runs ("AP exists").

2. Control Center's sequence: clear 0x07C6 bit 2, write the table, set 
0x07C6 bit 2. 0x07C5 bit 7 (SPLIT_TABLES) is per-profile "respective" 
CPU/GPU control and is left clear here.

3. Table semantics, from Control Center 5.1's FanTable_Manager1p5 (their 
names: TEMP_UP / TEMP_DOWN / DUTY):
- 0x0F00+k: temperature to step up from level k to k+1 (0x0F0F = 0xFF)
- 0x0F10+k: temperature to step down from level k to k-1 (0x0F10 unused)
- 0x0F20+k: duty for level k, 0-200 (percent * 2)
GPU tables are at 0x0F30/0x0F40/0x0F50 with the same layout. In Control 
Center's JSON, row i maps as UpT -> 0x0F00+i-1, DownT -> 0x0F10+i+1.

4. The EC can dump its own factory table: write the mode to 0x0F5F (1 = 
turbo, 2 = gaming, 3 = office), then 0xFD to 0x0F5D and 0xC9 to 0x0F5E, 
and poll until both change.

5. The factory curve here starts the fan at 35 C (about 40-50% duty at a 
50 C idle), which is the main complaint about this laptop. With a custom 
table (off below 57 C, 100% from 87 C) it idles silently and reached 
100% / ~7200 rpm under sustained load, peaking at 95 C.

Other notes: 0x0751 reads 0x20 on this machine, which matches none of 
Control Center's office/gaming/turbo values (0xA0/0x00/0x10). 
EC_ADDR_CHARGE_CTRL (0x07B9) reads 0, so charge modes rather than the 
threshold seem to be the right feature for this board, as for the 
PH4PG31/PH4PRX1 entries.

I've packaged this as an out-of-tree DKMS module and tool, so owners can 
use it now: https://gitlab.com/ozjonesy/venom-blackbook-linux

NOTES.md there has the full register map. The reverse engineering was 
done with an AI assistant's help, but everything above was tested on the 
hardware.

Would you be interested in:
- a DMI entry for this laptop (I can test whatever feature set you think 
fits; hwmon readings and charge modes work through the same registers 
your driver uses), and/or
- fan curve support in uniwill-laptop, perhaps through the standard 
hwmon pwm1_auto_point*_temp/_pwm attributes?

I'm not a kernel developer, but I'm happy to run test builds, dump 
registers or try patches on this machine.

Thanks for the driver,
Luke
