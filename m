Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C153132A3C1
	for <platform-driver-x86@vger.kernel.org>; Mon, 27 Oct 2025 19:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761593572; cv=none; b=Kpb5+z8TtI3GunncU0+b3MQVc+LdyxNpgpfA6YiHA6BVR9+KiKzE8G3yGzw4as5kEQH14FBFfKeYN2ckc+2yvB+N3WQSdMw6v7mPa++wushCrr0ox7UL1yJ9sMOr10whhzwcEszwloVQVGSvRNMV0DiR3iTkhIrql6YfwF21SHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761593572; c=relaxed/simple;
	bh=rl7V4BfZWPtX/eXCGRSXWsNZa6GoOv1dOL3kJKGGDcg=;
	h=Content-Type:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To; b=JCWCeGNAn5e1sBM5nmsVOx0hFOqFX8BY1ULh1D3BtUFlEjICG6QV8mimfbwpG27IAdHY4WRqZaSr1EZUD8yVAF1y4sIJe34SCDdrTPJKJwN4YPRjor4GSMztDnVPMnPsM2/4WhOtvLlbU9TR43/RF8xDcq5cOpUpjfGQCKGoKn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l00F4eMZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l00F4eMZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D72EC4CEF1;
	Mon, 27 Oct 2025 19:32:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761593572;
	bh=rl7V4BfZWPtX/eXCGRSXWsNZa6GoOv1dOL3kJKGGDcg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=l00F4eMZbWGgitaySv7M/a8KUwsE2agdbYHi8SfulX4tUCAFILcKp5DD4zVDY8CY5
	 LidkWHFn2rEncqN1H5B0gRUAa++NCS3PQZ6d3eejWv1rDE5j3DA6fkoywYh+Nh0dmV
	 wO3mfHO/0lUjU+KgGeFGBD2wh6N3UXd5I8Rck1ZLJQP52pIZk3MustExZHPk8wpZzS
	 k5Ch0twq8HRL8rL5klOUwOWyDoVgATq/7/nhsAHAiFhViEX3VXntuy2QT8djF9ztv/
	 gJi7XWM1n4Iy5iGmnuVSWqUJFL6Bk/6aQ+s2FkgS6sXbBjyOr5Ul+x6GWfnd9W2i9Z
	 inWYZWC8xaLAA==
Content-Type: multipart/mixed; boundary="------------VJxfK8h8g6LwX50BavS6Zuzi"
Message-ID: <6f81529b-7ae6-4d63-b0f3-7787a668698e@kernel.org>
Date: Mon, 27 Oct 2025 14:32:51 -0500
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: AMD PMF: CCP PSP fails to reinitialize after hibernation causing
 TEE errors
To: Lars Francke <lars.francke@gmail.com>
Cc: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 Tom Lendacky <thomas.lendacky@amd.com>, John Allen <john.allen@amd.com>,
 platform-driver-x86@vger.kernel.org, Patil Rajesh <Patil.Reddy@amd.com>
References: <CAD-Ua_gfJnQSo8ucS_7ZwzuhoBRJ14zXP7s8b-zX3ZcxcyWePw@mail.gmail.com>
 <92785bc4-e8e6-40b4-8ca6-43ef32c0b965@amd.com>
 <CAD-Ua_imV_eB3uYAbZV=AWaVMPMM4CpqzmYFDN7AvJs5q1yg_g@mail.gmail.com>
 <099ba5b9-600f-4604-94c4-781d4d91b091@amd.com>
 <84d6bd41-64ff-4380-ad87-54cfbb5bc1a0@gmail.com>
 <CAD-Ua_iHZtBJFXjBytXEhBwS9tJ79JUA7EB911hUZ0=OyoyLDQ@mail.gmail.com>
 <29af4c8f-e93b-49da-ad22-f5641f0046bb@kernel.org>
 <CAD-Ua_hYxHWa_rQWC6-2kMw4pXWt1fkdJT06AWeTZUbBFT-HDA@mail.gmail.com>
 <98d440b0-92b5-45aa-a42b-89dd5a243bae@kernel.org>
 <CAD-Ua_g+ifUOoJORoBiypgk3v4ynTjw=nvmoK6DJg2h-e7aXEQ@mail.gmail.com>
 <b6462189-5de6-4297-8d10-fce795c38ceb@amd.com>
 <2146bd06-a1ef-4668-ab34-f00172257424@kernel.org>
 <CAD-Ua_ixbf1ApMPMMSner28-fRg7BuhTu3QSw1U=ozqgS9fUjQ@mail.gmail.com>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <CAD-Ua_ixbf1ApMPMMSner28-fRg7BuhTu3QSw1U=ozqgS9fUjQ@mail.gmail.com>

This is a multi-part message in MIME format.
--------------VJxfK8h8g6LwX50BavS6Zuzi
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/27/25 11:18 AM, Lars Francke wrote:
> I changed the name and removed the macro and now get this with the
> attached patch (I added the "sp_restore called" log line)
> 
> Oct 27 12:44:47 lars-laptop kernel: sp_restore called
> Oct 27 12:44:47 lars-laptop kernel: ACPI: EC: event unblocked
> Oct 27 12:44:47 lars-laptop kernel: usb usb1: root hub lost power or was reset
> Oct 27 12:44:47 lars-laptop kernel: usb usb2: root hub lost power or was reset
> Oct 27 12:44:47 lars-laptop kernel: usb usb5: root hub lost power or was reset
> Oct 27 12:44:47 lars-laptop kernel: usb usb6: root hub lost power or was reset
> Oct 27 12:44:47 lars-laptop kernel: usb usb7: root hub lost power or was reset
> Oct 27 12:44:47 lars-laptop kernel: usb usb3: root hub lost power or was reset
> Oct 27 12:44:47 lars-laptop kernel: usb usb4: root hub lost power or was reset
> Oct 27 12:44:47 lars-laptop kernel: usb usb8: root hub lost power or was reset
> Oct 27 12:44:47 lars-laptop kernel: amdxdna 0000:c4:00.1: [drm]
> firmware resuming...
> Oct 27 12:44:47 lars-laptop kernel: [drm] PCIE GART of 512M enabled
> (table at 0x00000083FFB00000).
> Oct 27 12:44:47 lars-laptop kernel: amdgpu 0000:c3:00.0: amdgpu: PSP
> is resuming...
> Oct 27 12:44:47 lars-laptop kernel: ccp 0000:c3:00.2: tee: ring init
> command failed (0x0000000d)
> Oct 27 12:44:47 lars-laptop kernel: ccp 0000:c3:00.2: PM:
> dpm_run_callback(): pci_pm_restore returns -5
> Oct 27 12:44:47 lars-laptop kernel: ccp 0000:c3:00.2: PM: failed to
> restore async: error -5
> Oct 27 12:44:47 lars-laptop kernel: amdgpu 0000:c3:00.0: amdgpu:
> reserve 0x8c00000 from 0x83e0000000 for PSP TMR
> Oct 27 12:44:47 lars-laptop kernel: nvme nvme0: 32/0/0 default/read/poll queues
> Oct 27 12:44:47 lars-laptop kernel: cs35l56-hda
> i2c-CSC3554:00-cs35l54-hda.2: DSP1:
> cirrus/cs35l54-b0-dsp1-misc-103c8d01.wmfw: format 3 timestamp
> 0x66300c2d
> Oct 27 12:44:47 lars-laptop kernel: cs35l56-hda
> i2c-CSC3554:00-cs35l54-hda.2: DSP1:
> cirrus/cs35l54-b0-dsp1-misc-103c8d01.wmfw: Mon 29 Apr 2024 22:07:57
> GMT Daylight Time
> Oct 27 12:44:47 lars-laptop kernel: cs35l56-hda
> i2c-CSC3554:00-cs35l54-hda.0: DSP1:
> cirrus/cs35l54-b0-dsp1-misc-103c8d01.wmfw: format 3 timestamp
> 0x66300c2d
> Oct 27 12:44:47 lars-laptop kernel: cs35l56-hda
> i2c-CSC3554:00-cs35l54-hda.0: DSP1:
> cirrus/cs35l54-b0-dsp1-misc-103c8d01.wmfw: Mon 29 Apr 2024 22:07:57
> GMT Daylight Time
> Oct 27 12:44:47 lars-laptop kernel: cs35l56-hda
> i2c-CSC3554:00-cs35l54-hda.1: DSP1:
> cirrus/cs35l54-b0-dsp1-misc-103c8d01.wmfw: format 3 timestamp
> 0x66300c2d
> Oct 27 12:44:47 lars-laptop kernel: cs35l56-hda
> i2c-CSC3554:00-cs35l54-hda.1: DSP1:
> cirrus/cs35l54-b0-dsp1-misc-103c8d01.wmfw: Mon 29 Apr 2024 22:07:57
> GMT Daylight Time
> Oct 27 12:44:47 lars-laptop kernel: cs35l56-hda
> i2c-CSC3554:00-cs35l54-hda.3: DSP1:
> cirrus/cs35l54-b0-dsp1-misc-103c8d01.wmfw: format 3 timestamp
> 0x66300c2d
> Oct 27 12:44:47 lars-laptop kernel: cs35l56-hda
> i2c-CSC3554:00-cs35l54-hda.3: DSP1:
> cirrus/cs35l54-b0-dsp1-misc-103c8d01.wmfw: Mon 29 Apr 2024 22:07:57
> GMT Daylight Time
> Oct 27 12:44:47 lars-laptop kernel: amdxdna 0000:c4:00.1: [drm]
> hardware context resuming...
> Oct 27 12:44:47 lars-laptop kernel: usb 3-2: WARN: invalid context
> state for evaluate context command.
> Oct 27 12:44:47 lars-laptop kernel: usb 3-2: reset full-speed USB
> device number 2 using xhci_hcd
> Oct 27 12:44:47 lars-laptop kernel: usb 3-5: reset high-speed USB
> device number 4 using xhci_hcd
> Oct 27 12:44:47 lars-laptop kernel: cs35l56-hda
> i2c-CSC3554:00-cs35l54-hda.2: DSP1: Firmware: 1a00d6 vendor: 0x2
> v3.11.18, 41 algorithms
> Oct 27 12:44:47 lars-laptop kernel: cs35l56-hda
> i2c-CSC3554:00-cs35l54-hda.0: DSP1: Firmware: 1a00d6 vendor: 0x2
> v3.11.18, 41 algorithms
> Oct 27 12:44:47 lars-laptop kernel: cs35l56-hda
> i2c-CSC3554:00-cs35l54-hda.2: DSP1:
> cirrus/cs35l54-b0-dsp1-misc-103c8d01-amp3.bin: v3.11.18
> Oct 27 12:44:47 lars-laptop kernel: cs35l56-hda
> i2c-CSC3554:00-cs35l54-hda.2: DSP1: misc:
> C:\ProductSetting\HP\Chiron\Tuning_Relese\20250216\init\Right_Tweeter
> (131118.360100.80216)-init.bin
> Oct 27 12:44:47 lars-laptop kernel: cs35l56-hda
> i2c-CSC3554:00-cs35l54-hda.0: DSP1:
> cirrus/cs35l54-b0-dsp1-misc-103c8d01-amp1.bin: v3.11.18
> Oct 27 12:44:47 lars-laptop kernel: cs35l56-hda
> i2c-CSC3554:00-cs35l54-hda.0: DSP1: misc:
> C:\ProductSetting\HP\Chiron\Tuning_Relese\20250216\init\Left_Woofer
> (131118.360200.80216)-init.bin
> Oct 27 12:44:47 lars-laptop kernel: cs35l56-hda
> i2c-CSC3554:00-cs35l54-hda.1: DSP1: Firmware: 1a00d6 vendor: 0x2
> v3.11.18, 41 algorithms
> Oct 27 12:44:47 lars-laptop kernel: cs35l56-hda
> i2c-CSC3554:00-cs35l54-hda.3: DSP1: Firmware: 1a00d6 vendor: 0x2
> v3.11.18, 41 algorithms
> Oct 27 12:44:47 lars-laptop kernel: cs35l56-hda
> i2c-CSC3554:00-cs35l54-hda.1: DSP1:
> cirrus/cs35l54-b0-dsp1-misc-103c8d01-amp2.bin: v3.11.18
> Oct 27 12:44:47 lars-laptop kernel: cs35l56-hda
> i2c-CSC3554:00-cs35l54-hda.1: DSP1: misc:
> C:\ProductSetting\HP\Chiron\Tuning_Relese\20250216\init\Left_Tweeter
> (131118.360300.80216)-init.bin
> Oct 27 12:44:47 lars-laptop kernel: cs35l56-hda
> i2c-CSC3554:00-cs35l54-hda.3: DSP1:
> cirrus/cs35l54-b0-dsp1-misc-103c8d01-amp4.bin: v3.11.18
> Oct 27 12:44:47 lars-laptop kernel: cs35l56-hda
> i2c-CSC3554:00-cs35l54-hda.3: DSP1: misc:
> C:\ProductSetting\HP\Chiron\Tuning_Relese\20250216\init\Right_Woofer
> (131118.360000.80216)-init.bin
> Oct 27 12:44:47 lars-laptop kernel: amdgpu 0000:c3:00.0: amdgpu: RAS:
> optional ras ta ucode is not available
> Oct 27 12:44:47 lars-laptop kernel: amdgpu 0000:c3:00.0: amdgpu: RAP:
> optional rap ta ucode is not available
> Oct 27 12:44:47 lars-laptop kernel: amdgpu 0000:c3:00.0: amdgpu:
> SECUREDISPLAY: optional securedisplay ta ucode is not available
> Oct 27 12:44:47 lars-laptop kernel: amdgpu 0000:c3:00.0: amdgpu: SMU
> is resuming...
> Oct 27 12:44:47 lars-laptop kernel: amdgpu 0000:c3:00.0: amdgpu: SMU
> is resumed successfully!
> Oct 27 12:44:47 lars-laptop kernel: amdgpu 0000:c3:00.0: amdgpu: [drm]
> DMUB hardware initialized: version=0x09003100
> Oct 27 12:44:47 lars-laptop kernel: amdgpu 0000:c3:00.0: amdgpu: ring
> gfx_0.0.0 uses VM inv eng 0 on hub 0
> Oct 27 12:44:47 lars-laptop kernel: amdgpu 0000:c3:00.0: amdgpu: ring
> comp_1.0.0 uses VM inv eng 1 on hub 0
> Oct 27 12:44:47 lars-laptop kernel: amdgpu 0000:c3:00.0: amdgpu: ring
> comp_1.1.0 uses VM inv eng 4 on hub 0
> Oct 27 12:44:47 lars-laptop kernel: amdgpu 0000:c3:00.0: amdgpu: ring
> comp_1.2.0 uses VM inv eng 6 on hub 0
> Oct 27 12:44:47 lars-laptop kernel: amdgpu 0000:c3:00.0: amdgpu: ring
> comp_1.3.0 uses VM inv eng 7 on hub 0
> Oct 27 12:44:47 lars-laptop kernel: amdgpu 0000:c3:00.0: amdgpu: ring
> comp_1.0.1 uses VM inv eng 8 on hub 0
> Oct 27 12:44:47 lars-laptop kernel: amdgpu 0000:c3:00.0: amdgpu: ring
> comp_1.1.1 uses VM inv eng 9 on hub 0
> Oct 27 12:44:47 lars-laptop kernel: amdgpu 0000:c3:00.0: amdgpu: ring
> comp_1.2.1 uses VM inv eng 10 on hub 0
> Oct 27 12:44:47 lars-laptop kernel: amdgpu 0000:c3:00.0: amdgpu: ring
> comp_1.3.1 uses VM inv eng 11 on hub 0
> Oct 27 12:44:47 lars-laptop kernel: amdgpu 0000:c3:00.0: amdgpu: ring
> sdma0 uses VM inv eng 12 on hub 0
> Oct 27 12:44:47 lars-laptop kernel: amdgpu 0000:c3:00.0: amdgpu: ring
> vcn_unified_0 uses VM inv eng 0 on hub 8
> Oct 27 12:44:47 lars-laptop kernel: amdgpu 0000:c3:00.0: amdgpu: ring
> vcn_unified_1 uses VM inv eng 1 on hub 8
> Oct 27 12:44:47 lars-laptop kernel: amdgpu 0000:c3:00.0: amdgpu: ring
> jpeg_dec_0 uses VM inv eng 4 on hub 8
> Oct 27 12:44:47 lars-laptop kernel: amdgpu 0000:c3:00.0: amdgpu: ring
> jpeg_dec_1 uses VM inv eng 6 on hub 8
> Oct 27 12:44:47 lars-laptop kernel: amdgpu 0000:c3:00.0: amdgpu: ring
> mes_kiq_3.1.0 uses VM inv eng 13 on hub 0
> Oct 27 12:44:47 lars-laptop kernel: amdgpu 0000:c3:00.0: amdgpu: ring
> vpe uses VM inv eng 7 on hub 8
> Oct 27 12:44:47 lars-laptop kernel: cs35l56-hda
> i2c-CSC3554:00-cs35l54-hda.2: Calibration applied
> Oct 27 12:44:47 lars-laptop kernel: cs35l56-hda
> i2c-CSC3554:00-cs35l54-hda.0: Calibration applied
> Oct 27 12:44:47 lars-laptop kernel: cs35l56-hda
> i2c-CSC3554:00-cs35l54-hda.2: Tuning PID: 0x131118, SID: 0x360100,
> TID: 0x80216
> Oct 27 12:44:47 lars-laptop kernel: cs35l56-hda
> i2c-CSC3554:00-cs35l54-hda.0: Tuning PID: 0x131118, SID: 0x360200,
> TID: 0x80216
> Oct 27 12:44:47 lars-laptop kernel: cs35l56-hda
> i2c-CSC3554:00-cs35l54-hda.1: Calibration applied
> Oct 27 12:44:47 lars-laptop kernel: cs35l56-hda
> i2c-CSC3554:00-cs35l54-hda.3: Calibration applied
> Oct 27 12:44:47 lars-laptop kernel: cs35l56-hda
> i2c-CSC3554:00-cs35l54-hda.1: Tuning PID: 0x131118, SID: 0x360300,
> TID: 0x80216
> Oct 27 12:44:47 lars-laptop kernel: cs35l56-hda
> i2c-CSC3554:00-cs35l54-hda.3: Tuning PID: 0x131118, SID: 0x360000,
> TID: 0x80216
> Oct 27 12:44:47 lars-laptop kernel: BUG: kernel NULL pointer
> dereference, address: 00000000000003fc
> Oct 27 12:44:47 lars-laptop kernel: #PF: supervisor read access in kernel mode
> Oct 27 12:44:47 lars-laptop kernel: #PF: error_code(0x0000) - not-present page
> 
> Then I have to reboot. I'm happy to try more patches - but I have way
> too little knowledge about any of this to be of any other help I'm
> afraid.
> 
> Thanks,
> Lars
> 

See if this one helps.  I do think we still need a PMF change though too.

Thanks,

--------------VJxfK8h8g6LwX50BavS6Zuzi
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-crypto-ccp-Add-an-S4-restore-flow.patch"
Content-Disposition: attachment;
 filename="0001-crypto-ccp-Add-an-S4-restore-flow.patch"
Content-Transfer-Encoding: base64

RnJvbSA0ZjY2OTYxOGY0ZTQ1NjI3Mjk1ODU0ZTY5YzUxNmRkMmEzN2EwZTc1IE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiAiTWFyaW8gTGltb25jaWVsbG8gKEFNRCkiIDxzdXBl
cm0xQGtlcm5lbC5vcmc+CkRhdGU6IFN1biwgMjYgT2N0IDIwMjUgMTI6MzQ6NDggLTA1MDAK
U3ViamVjdDogW1BBVENIXSBjcnlwdG86IGNjcCAtIEFkZCBhbiBTNCByZXN0b3JlIGZsb3cK
ClRoZSBzeXN0ZW0gd2lsbCBoYXZlIGxvc3QgcG93ZXIgZHVyaW5nIFM0LiAgVGhlIHJpbmcg
dXNlZCBmb3IgVEVFCmNvbW11bmljYXRpb25zIG5lZWRzIHRvIGJlIGluaXRpYWxpemVkIGJl
Zm9yZSB1c2UuCgpTaWduZWQtb2ZmLWJ5OiBNYXJpbyBMaW1vbmNpZWxsbyAoQU1EKSA8c3Vw
ZXJtMUBrZXJuZWwub3JnPgotLS0KIGRyaXZlcnMvY3J5cHRvL2NjcC9zcC1kZXYuYyAgfCAx
MyArKysrKysrKysrKysrCiBkcml2ZXJzL2NyeXB0by9jY3Avc3AtZGV2LmggIHwgIDEgKwog
ZHJpdmVycy9jcnlwdG8vY2NwL3NwLXBjaS5jICB8IDE2ICsrKysrKysrKysrKysrKy0KIGRy
aXZlcnMvY3J5cHRvL2NjcC90ZWUtZGV2LmMgfCAgNiArKysrKysKIGRyaXZlcnMvY3J5cHRv
L2NjcC90ZWUtZGV2LmggfCAgMSArCiA1IGZpbGVzIGNoYW5nZWQsIDM2IGluc2VydGlvbnMo
KyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2NyeXB0by9jY3Avc3At
ZGV2LmMgYi9kcml2ZXJzL2NyeXB0by9jY3Avc3AtZGV2LmMKaW5kZXggMzQ2N2Y2ZGI0ZjUw
Li5lM2ZhOTRkMTQwMjYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvY3J5cHRvL2NjcC9zcC1kZXYu
YworKysgYi9kcml2ZXJzL2NyeXB0by9jY3Avc3AtZGV2LmMKQEAgLTIxLDYgKzIxLDcgQEAK
IAogI2luY2x1ZGUgInNldi1kZXYuaCIKICNpbmNsdWRlICJjY3AtZGV2LmgiCisjaW5jbHVk
ZSAidGVlLWRldi5oIgogI2luY2x1ZGUgInNwLWRldi5oIgogCiBNT0RVTEVfQVVUSE9SKCJU
b20gTGVuZGFja3kgPHRob21hcy5sZW5kYWNreUBhbWQuY29tPiIpOwpAQCAtMjMwLDYgKzIz
MSwxOCBAQCBpbnQgc3BfcmVzdW1lKHN0cnVjdCBzcF9kZXZpY2UgKnNwKQogCXJldHVybiAw
OwogfQogCitpbnQgc3BfcmVzdG9yZShzdHJ1Y3Qgc3BfZGV2aWNlICpzcCkKK3sKKwlpZiAo
c3AtPmRldl92ZGF0YS0+cHNwX3ZkYXRhLT50ZWUpIHsKKwkJaW50IHIgPSB0ZWVfcmVzdG9y
ZShzcC0+cHNwX2RhdGEpOworCisJCWlmIChyKQorCQkJcmV0dXJuIHI7CisJfQorCisJcmV0
dXJuIHNwX3Jlc3VtZShzcCk7Cit9CisKIHN0cnVjdCBzcF9kZXZpY2UgKnNwX2dldF9wc3Bf
bWFzdGVyX2RldmljZSh2b2lkKQogewogCXN0cnVjdCBzcF9kZXZpY2UgKmksICpyZXQgPSBO
VUxMOwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9jcnlwdG8vY2NwL3NwLWRldi5oIGIvZHJpdmVy
cy9jcnlwdG8vY2NwL3NwLWRldi5oCmluZGV4IDZmOWQ3MDYzMjU3ZC4uMzdiMzhhZmFhYjE0
IDEwMDY0NAotLS0gYS9kcml2ZXJzL2NyeXB0by9jY3Avc3AtZGV2LmgKKysrIGIvZHJpdmVy
cy9jcnlwdG8vY2NwL3NwLWRldi5oCkBAIC0xNDEsNiArMTQxLDcgQEAgdm9pZCBzcF9kZXN0
cm95KHN0cnVjdCBzcF9kZXZpY2UgKnNwKTsKIAogaW50IHNwX3N1c3BlbmQoc3RydWN0IHNw
X2RldmljZSAqc3ApOwogaW50IHNwX3Jlc3VtZShzdHJ1Y3Qgc3BfZGV2aWNlICpzcCk7Citp
bnQgc3BfcmVzdG9yZShzdHJ1Y3Qgc3BfZGV2aWNlICpzcCk7CiBpbnQgc3BfcmVxdWVzdF9j
Y3BfaXJxKHN0cnVjdCBzcF9kZXZpY2UgKnNwLCBpcnFfaGFuZGxlcl90IGhhbmRsZXIsCiAJ
CSAgICAgICBjb25zdCBjaGFyICpuYW1lLCB2b2lkICpkYXRhKTsKIHZvaWQgc3BfZnJlZV9j
Y3BfaXJxKHN0cnVjdCBzcF9kZXZpY2UgKnNwLCB2b2lkICpkYXRhKTsKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvY3J5cHRvL2NjcC9zcC1wY2kuYyBiL2RyaXZlcnMvY3J5cHRvL2NjcC9zcC1w
Y2kuYwppbmRleCA4ODkxY2VlZTFkN2QuLjE0MTljZGNmMmFjNSAxMDA2NDQKLS0tIGEvZHJp
dmVycy9jcnlwdG8vY2NwL3NwLXBjaS5jCisrKyBiL2RyaXZlcnMvY3J5cHRvL2NjcC9zcC1w
Y2kuYwpAQCAtMzUzLDYgKzM1MywxMyBAQCBzdGF0aWMgaW50IF9fbWF5YmVfdW51c2VkIHNw
X3BjaV9yZXN1bWUoc3RydWN0IGRldmljZSAqZGV2KQogCXJldHVybiBzcF9yZXN1bWUoc3Ap
OwogfQogCitzdGF0aWMgaW50IF9fbWF5YmVfdW51c2VkIHNwX3BjaV9yZXN0b3JlKHN0cnVj
dCBkZXZpY2UgKmRldikKK3sKKwlzdHJ1Y3Qgc3BfZGV2aWNlICpzcCA9IGRldl9nZXRfZHJ2
ZGF0YShkZXYpOworCisJcmV0dXJuIHNwX3Jlc3RvcmUoc3ApOworfQorCiAjaWZkZWYgQ09O
RklHX0NSWVBUT19ERVZfU1BfUFNQCiBzdGF0aWMgY29uc3Qgc3RydWN0IHNldl92ZGF0YSBz
ZXZ2MSA9IHsKIAkuY21kcmVzcF9yZWcJCT0gMHgxMDU4MCwJLyogQzJQTVNHXzMyICovCkBA
IC01NjMsNyArNTcwLDE0IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgcGNpX2RldmljZV9pZCBz
cF9wY2lfdGFibGVbXSA9IHsKIH07CiBNT0RVTEVfREVWSUNFX1RBQkxFKHBjaSwgc3BfcGNp
X3RhYmxlKTsKIAotc3RhdGljIFNJTVBMRV9ERVZfUE1fT1BTKHNwX3BjaV9wbV9vcHMsIHNw
X3BjaV9zdXNwZW5kLCBzcF9wY2lfcmVzdW1lKTsKK2NvbnN0IHN0cnVjdCBkZXZfcG1fb3Bz
IHNwX3BjaV9wbV9vcHMgPSB7CisJLnN1c3BlbmQgPSBwbV9zbGVlcF9wdHIoc3BfcGNpX3N1
c3BlbmQpLAorCS5yZXN1bWUgPSBwbV9zbGVlcF9wdHIoc3BfcGNpX3Jlc3VtZSksCisJLmZy
ZWV6ZSA9IHBtX3NsZWVwX3B0cihzcF9wY2lfc3VzcGVuZCksCisJLnRoYXcgPSBwbV9zbGVl
cF9wdHIoc3BfcGNpX3Jlc3VtZSksCisJLnBvd2Vyb2ZmID0gcG1fc2xlZXBfcHRyKHNwX3Bj
aV9zdXNwZW5kKSwKKwkucmVzdG9yZSA9IHBtX3NsZWVwX3B0cihzcF9wY2lfcmVzdG9yZSks
Cit9OwogCiBzdGF0aWMgc3RydWN0IHBjaV9kcml2ZXIgc3BfcGNpX2RyaXZlciA9IHsKIAku
bmFtZSA9ICJjY3AiLApkaWZmIC0tZ2l0IGEvZHJpdmVycy9jcnlwdG8vY2NwL3RlZS1kZXYu
YyBiL2RyaXZlcnMvY3J5cHRvL2NjcC90ZWUtZGV2LmMKaW5kZXggNWUxZDgwNzI0Njc4Li42
NjQ2OGRlMDhmYzMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvY3J5cHRvL2NjcC90ZWUtZGV2LmMK
KysrIGIvZHJpdmVycy9jcnlwdG8vY2NwL3RlZS1kZXYuYwpAQCAtMzY1LDMgKzM2NSw5IEBA
IGludCBwc3BfY2hlY2tfdGVlX3N0YXR1cyh2b2lkKQogCXJldHVybiAwOwogfQogRVhQT1JU
X1NZTUJPTChwc3BfY2hlY2tfdGVlX3N0YXR1cyk7CisKK2ludCB0ZWVfcmVzdG9yZShzdHJ1
Y3QgcHNwX2RldmljZSAqcHNwKQoreworCXRlZV9mcmVlX3JpbmcocHNwLT50ZWVfZGF0YSk7
CisJcmV0dXJuIHRlZV9pbml0X3JpbmcocHNwLT50ZWVfZGF0YSk7Cit9CmRpZmYgLS1naXQg
YS9kcml2ZXJzL2NyeXB0by9jY3AvdGVlLWRldi5oIGIvZHJpdmVycy9jcnlwdG8vY2NwL3Rl
ZS1kZXYuaAppbmRleCBlYTlhMmI3YzA1ZjUuLmMyMzQxNmNiN2JiMyAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9jcnlwdG8vY2NwL3RlZS1kZXYuaAorKysgYi9kcml2ZXJzL2NyeXB0by9jY3Av
dGVlLWRldi5oCkBAIC0xMTEsNSArMTExLDYgQEAgc3RydWN0IHRlZV9yaW5nX2NtZCB7CiAK
IGludCB0ZWVfZGV2X2luaXQoc3RydWN0IHBzcF9kZXZpY2UgKnBzcCk7CiB2b2lkIHRlZV9k
ZXZfZGVzdHJveShzdHJ1Y3QgcHNwX2RldmljZSAqcHNwKTsKK2ludCB0ZWVfcmVzdG9yZShz
dHJ1Y3QgcHNwX2RldmljZSAqcHNwKTsKIAogI2VuZGlmIC8qIF9fVEVFX0RFVl9IX18gKi8K
LS0gCjIuNTEuMQoK

--------------VJxfK8h8g6LwX50BavS6Zuzi--
