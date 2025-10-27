Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 600FA30146F
	for <platform-driver-x86@vger.kernel.org>; Mon, 27 Oct 2025 16:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761581937; cv=none; b=nlvFHzzotmg6lAMYwLNb50jCz2FOHHiq/6bkIEtF016G8fDYcusrW9D3pQ01wdI5J4P2Dm4/H5/OQXv8Onflui9b8YuuPNb4lWSsou2l2c3Id6CEsIMpAwKfxE/olHN1wxWmNEI+unz7iDqNUZoe39ZhBmhwAjGHzS5lSJ1YvtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761581937; c=relaxed/simple;
	bh=zsT7zZQ16JLkPYuQn6BoiNw5YF/oFnCqPcl68j3Al84=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=crbjuYmJpKJuMFKa9k3pvpCGaenbqwS8m/m8XXK/GLm4pGqTZHQjNV8pA2ZuSpWV7Te0CsgKjU6kIpsbfWxoEjXwA6K8TeRln8x9PWm0jMBeN3D/kYLbl0H9khtNn+yus5gGTirR66LKRYJ7YckJVFR5JaOgUD75aEWFER/1kmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HixY/BzX; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HixY/BzX"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-88f8f346c2cso499905085a.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 27 Oct 2025 09:18:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761581934; x=1762186734; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=e5SgkIdwlfLMfm8ZM/BxNBC1+cCb5qTtnAPJbSp1A90=;
        b=HixY/BzX9ffGhjAQEPn/7J9gT0s6XK8wwH/EiTpsTcB5JvOZJ0MdMpetX0rB0GhjoJ
         GoF5cTe/k/+9PHkXyce2pT02szd8S4QXwTUXkWW8cb1znB0uOs3L+A/lUKO5735S9JCy
         Xj/6HRhN4XTlMBxFLO9F3J/M7I4VUBUPbnWeLXzEGWTU4UDe2DwaCni1QCkhVHcxGbaE
         AXHUsOfWDHubzYsdEs/lPrwdhfInbALHE8WkD7df/GGQRK4LRbWzHPPgTQmOHgHjKOhh
         I9wdNiP28efbMUhyZ14BokbGwZKoSJ//IZH7uE9WnGY8coO9UPFiskKFPhXekjSLCdIn
         E86w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761581934; x=1762186734;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e5SgkIdwlfLMfm8ZM/BxNBC1+cCb5qTtnAPJbSp1A90=;
        b=njJW6M+NFpn7psscAXnb/OFSEgu/9gv5NLS4XiJsfEega06p3KR9cFcubdINiZ9JQe
         zU0w6xLzH5xDBHrB65f9DAIWvYbZXQbOFdVBlv9WVvUVuspWak18QajyFtXEGtq6/6mz
         NbbpmqRqfy2lLGUDb2K/8Jw8chFFcRbio+ps/6CxvfaV9o6/QZEUYs1wj5wiWvr5XX1o
         jyHlxEtBEAdjfplc1bv7UaGepWFW8ZvMrmqMXwNDNlGLR2wqgLlBH2KNN1ZSh54tMgb9
         7f/rOrGYY4kxA8ajhvryt7qobJyzIl+vqOzOaHBImgV+rR8iWGus8WtqrpvafxMCz1C1
         1mIg==
X-Forwarded-Encrypted: i=1; AJvYcCUohGYnOy8kXEWlHVSK2a48zOo2keLnjHEzy6xvDQZ/m/172CpEZNUFWPv+jdAnz7+afBXkx6bmhQaVXPEGLt62HHVE@vger.kernel.org
X-Gm-Message-State: AOJu0YxabYM1/sl5FniOsQgZdhq1XCpmJI8KB1u7JXSEP6zlLZ5qnQyp
	7kUWkm/zD/1AhR5N6QIIM9E2JBmQqB2FYQE9V33bZhoO8ic87+6n4l/8c3+1AxF9RQQyJOsbR2k
	Bm0lf8jrE7q8gVNnbNmTKs5ogisaVRgOoSw99McBuMQ==
X-Gm-Gg: ASbGncviEVEuTAV0rRCoQWJ+enKxm0JL1xaViCj7KAXV3aSEkwfK4NrVt8iL5zEbIyF
	WsuWSv6mcnNbTAWe9SWHsz30xhSAknduKoz/5LRv+oyvpQQ5bbsmP8D0CRkEY12fEMu9EC1F+Xh
	zx7G5ESxDJ+nRUYXlBNnPnqURtq3GVU0n9busiYEB/ixjs/E/D6j/7qdZ70mZRrE/z4nL33vMB+
	fpkDjhQke3lB7m38d9vM6zJ+AetI8Nf7wZNRdtEorMwy1LtUNCt61v2ybAasw==
X-Google-Smtp-Source: AGHT+IGPGibNspILG16zeQKyfS5YMe+O7UH7NZrJRV21JS+Uh7khuAef/EjQneecp42ZZN8c8JrE4mQlcQKvOht90qY=
X-Received: by 2002:a05:620a:394f:b0:891:937a:b095 with SMTP id
 af79cd13be357-8a6f3c36631mr70674885a.16.1761581932438; Mon, 27 Oct 2025
 09:18:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAD-Ua_gfJnQSo8ucS_7ZwzuhoBRJ14zXP7s8b-zX3ZcxcyWePw@mail.gmail.com>
 <92785bc4-e8e6-40b4-8ca6-43ef32c0b965@amd.com> <CAD-Ua_imV_eB3uYAbZV=AWaVMPMM4CpqzmYFDN7AvJs5q1yg_g@mail.gmail.com>
 <099ba5b9-600f-4604-94c4-781d4d91b091@amd.com> <84d6bd41-64ff-4380-ad87-54cfbb5bc1a0@gmail.com>
 <CAD-Ua_iHZtBJFXjBytXEhBwS9tJ79JUA7EB911hUZ0=OyoyLDQ@mail.gmail.com>
 <29af4c8f-e93b-49da-ad22-f5641f0046bb@kernel.org> <CAD-Ua_hYxHWa_rQWC6-2kMw4pXWt1fkdJT06AWeTZUbBFT-HDA@mail.gmail.com>
 <98d440b0-92b5-45aa-a42b-89dd5a243bae@kernel.org> <CAD-Ua_g+ifUOoJORoBiypgk3v4ynTjw=nvmoK6DJg2h-e7aXEQ@mail.gmail.com>
 <b6462189-5de6-4297-8d10-fce795c38ceb@amd.com> <2146bd06-a1ef-4668-ab34-f00172257424@kernel.org>
In-Reply-To: <2146bd06-a1ef-4668-ab34-f00172257424@kernel.org>
From: Lars Francke <lars.francke@gmail.com>
Date: Mon, 27 Oct 2025 17:18:15 +0100
X-Gm-Features: AWmQ_bnRbfPyH1tGaP7a94cga1tZwERnmHmTJyn3R3Hb38Fi5DhxmAwE1z9GpkM
Message-ID: <CAD-Ua_ixbf1ApMPMMSner28-fRg7BuhTu3QSw1U=ozqgS9fUjQ@mail.gmail.com>
Subject: Re: AMD PMF: CCP PSP fails to reinitialize after hibernation causing
 TEE errors
To: Mario Limonciello <superm1@kernel.org>
Cc: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, Tom Lendacky <thomas.lendacky@amd.com>, 
	John Allen <john.allen@amd.com>, platform-driver-x86@vger.kernel.org, 
	Patil Rajesh <Patil.Reddy@amd.com>
Content-Type: multipart/mixed; boundary="0000000000005421df06422641a0"

--0000000000005421df06422641a0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I changed the name and removed the macro and now get this with the
attached patch (I added the "sp_restore called" log line)

Oct 27 12:44:47 lars-laptop kernel: sp_restore called
Oct 27 12:44:47 lars-laptop kernel: ACPI: EC: event unblocked
Oct 27 12:44:47 lars-laptop kernel: usb usb1: root hub lost power or was re=
set
Oct 27 12:44:47 lars-laptop kernel: usb usb2: root hub lost power or was re=
set
Oct 27 12:44:47 lars-laptop kernel: usb usb5: root hub lost power or was re=
set
Oct 27 12:44:47 lars-laptop kernel: usb usb6: root hub lost power or was re=
set
Oct 27 12:44:47 lars-laptop kernel: usb usb7: root hub lost power or was re=
set
Oct 27 12:44:47 lars-laptop kernel: usb usb3: root hub lost power or was re=
set
Oct 27 12:44:47 lars-laptop kernel: usb usb4: root hub lost power or was re=
set
Oct 27 12:44:47 lars-laptop kernel: usb usb8: root hub lost power or was re=
set
Oct 27 12:44:47 lars-laptop kernel: amdxdna 0000:c4:00.1: [drm]
firmware resuming...
Oct 27 12:44:47 lars-laptop kernel: [drm] PCIE GART of 512M enabled
(table at 0x00000083FFB00000).
Oct 27 12:44:47 lars-laptop kernel: amdgpu 0000:c3:00.0: amdgpu: PSP
is resuming...
Oct 27 12:44:47 lars-laptop kernel: ccp 0000:c3:00.2: tee: ring init
command failed (0x0000000d)
Oct 27 12:44:47 lars-laptop kernel: ccp 0000:c3:00.2: PM:
dpm_run_callback(): pci_pm_restore returns -5
Oct 27 12:44:47 lars-laptop kernel: ccp 0000:c3:00.2: PM: failed to
restore async: error -5
Oct 27 12:44:47 lars-laptop kernel: amdgpu 0000:c3:00.0: amdgpu:
reserve 0x8c00000 from 0x83e0000000 for PSP TMR
Oct 27 12:44:47 lars-laptop kernel: nvme nvme0: 32/0/0 default/read/poll qu=
eues
Oct 27 12:44:47 lars-laptop kernel: cs35l56-hda
i2c-CSC3554:00-cs35l54-hda.2: DSP1:
cirrus/cs35l54-b0-dsp1-misc-103c8d01.wmfw: format 3 timestamp
0x66300c2d
Oct 27 12:44:47 lars-laptop kernel: cs35l56-hda
i2c-CSC3554:00-cs35l54-hda.2: DSP1:
cirrus/cs35l54-b0-dsp1-misc-103c8d01.wmfw: Mon 29 Apr 2024 22:07:57
GMT Daylight Time
Oct 27 12:44:47 lars-laptop kernel: cs35l56-hda
i2c-CSC3554:00-cs35l54-hda.0: DSP1:
cirrus/cs35l54-b0-dsp1-misc-103c8d01.wmfw: format 3 timestamp
0x66300c2d
Oct 27 12:44:47 lars-laptop kernel: cs35l56-hda
i2c-CSC3554:00-cs35l54-hda.0: DSP1:
cirrus/cs35l54-b0-dsp1-misc-103c8d01.wmfw: Mon 29 Apr 2024 22:07:57
GMT Daylight Time
Oct 27 12:44:47 lars-laptop kernel: cs35l56-hda
i2c-CSC3554:00-cs35l54-hda.1: DSP1:
cirrus/cs35l54-b0-dsp1-misc-103c8d01.wmfw: format 3 timestamp
0x66300c2d
Oct 27 12:44:47 lars-laptop kernel: cs35l56-hda
i2c-CSC3554:00-cs35l54-hda.1: DSP1:
cirrus/cs35l54-b0-dsp1-misc-103c8d01.wmfw: Mon 29 Apr 2024 22:07:57
GMT Daylight Time
Oct 27 12:44:47 lars-laptop kernel: cs35l56-hda
i2c-CSC3554:00-cs35l54-hda.3: DSP1:
cirrus/cs35l54-b0-dsp1-misc-103c8d01.wmfw: format 3 timestamp
0x66300c2d
Oct 27 12:44:47 lars-laptop kernel: cs35l56-hda
i2c-CSC3554:00-cs35l54-hda.3: DSP1:
cirrus/cs35l54-b0-dsp1-misc-103c8d01.wmfw: Mon 29 Apr 2024 22:07:57
GMT Daylight Time
Oct 27 12:44:47 lars-laptop kernel: amdxdna 0000:c4:00.1: [drm]
hardware context resuming...
Oct 27 12:44:47 lars-laptop kernel: usb 3-2: WARN: invalid context
state for evaluate context command.
Oct 27 12:44:47 lars-laptop kernel: usb 3-2: reset full-speed USB
device number 2 using xhci_hcd
Oct 27 12:44:47 lars-laptop kernel: usb 3-5: reset high-speed USB
device number 4 using xhci_hcd
Oct 27 12:44:47 lars-laptop kernel: cs35l56-hda
i2c-CSC3554:00-cs35l54-hda.2: DSP1: Firmware: 1a00d6 vendor: 0x2
v3.11.18, 41 algorithms
Oct 27 12:44:47 lars-laptop kernel: cs35l56-hda
i2c-CSC3554:00-cs35l54-hda.0: DSP1: Firmware: 1a00d6 vendor: 0x2
v3.11.18, 41 algorithms
Oct 27 12:44:47 lars-laptop kernel: cs35l56-hda
i2c-CSC3554:00-cs35l54-hda.2: DSP1:
cirrus/cs35l54-b0-dsp1-misc-103c8d01-amp3.bin: v3.11.18
Oct 27 12:44:47 lars-laptop kernel: cs35l56-hda
i2c-CSC3554:00-cs35l54-hda.2: DSP1: misc:
C:\ProductSetting\HP\Chiron\Tuning_Relese\20250216\init\Right_Tweeter
(131118.360100.80216)-init.bin
Oct 27 12:44:47 lars-laptop kernel: cs35l56-hda
i2c-CSC3554:00-cs35l54-hda.0: DSP1:
cirrus/cs35l54-b0-dsp1-misc-103c8d01-amp1.bin: v3.11.18
Oct 27 12:44:47 lars-laptop kernel: cs35l56-hda
i2c-CSC3554:00-cs35l54-hda.0: DSP1: misc:
C:\ProductSetting\HP\Chiron\Tuning_Relese\20250216\init\Left_Woofer
(131118.360200.80216)-init.bin
Oct 27 12:44:47 lars-laptop kernel: cs35l56-hda
i2c-CSC3554:00-cs35l54-hda.1: DSP1: Firmware: 1a00d6 vendor: 0x2
v3.11.18, 41 algorithms
Oct 27 12:44:47 lars-laptop kernel: cs35l56-hda
i2c-CSC3554:00-cs35l54-hda.3: DSP1: Firmware: 1a00d6 vendor: 0x2
v3.11.18, 41 algorithms
Oct 27 12:44:47 lars-laptop kernel: cs35l56-hda
i2c-CSC3554:00-cs35l54-hda.1: DSP1:
cirrus/cs35l54-b0-dsp1-misc-103c8d01-amp2.bin: v3.11.18
Oct 27 12:44:47 lars-laptop kernel: cs35l56-hda
i2c-CSC3554:00-cs35l54-hda.1: DSP1: misc:
C:\ProductSetting\HP\Chiron\Tuning_Relese\20250216\init\Left_Tweeter
(131118.360300.80216)-init.bin
Oct 27 12:44:47 lars-laptop kernel: cs35l56-hda
i2c-CSC3554:00-cs35l54-hda.3: DSP1:
cirrus/cs35l54-b0-dsp1-misc-103c8d01-amp4.bin: v3.11.18
Oct 27 12:44:47 lars-laptop kernel: cs35l56-hda
i2c-CSC3554:00-cs35l54-hda.3: DSP1: misc:
C:\ProductSetting\HP\Chiron\Tuning_Relese\20250216\init\Right_Woofer
(131118.360000.80216)-init.bin
Oct 27 12:44:47 lars-laptop kernel: amdgpu 0000:c3:00.0: amdgpu: RAS:
optional ras ta ucode is not available
Oct 27 12:44:47 lars-laptop kernel: amdgpu 0000:c3:00.0: amdgpu: RAP:
optional rap ta ucode is not available
Oct 27 12:44:47 lars-laptop kernel: amdgpu 0000:c3:00.0: amdgpu:
SECUREDISPLAY: optional securedisplay ta ucode is not available
Oct 27 12:44:47 lars-laptop kernel: amdgpu 0000:c3:00.0: amdgpu: SMU
is resuming...
Oct 27 12:44:47 lars-laptop kernel: amdgpu 0000:c3:00.0: amdgpu: SMU
is resumed successfully!
Oct 27 12:44:47 lars-laptop kernel: amdgpu 0000:c3:00.0: amdgpu: [drm]
DMUB hardware initialized: version=3D0x09003100
Oct 27 12:44:47 lars-laptop kernel: amdgpu 0000:c3:00.0: amdgpu: ring
gfx_0.0.0 uses VM inv eng 0 on hub 0
Oct 27 12:44:47 lars-laptop kernel: amdgpu 0000:c3:00.0: amdgpu: ring
comp_1.0.0 uses VM inv eng 1 on hub 0
Oct 27 12:44:47 lars-laptop kernel: amdgpu 0000:c3:00.0: amdgpu: ring
comp_1.1.0 uses VM inv eng 4 on hub 0
Oct 27 12:44:47 lars-laptop kernel: amdgpu 0000:c3:00.0: amdgpu: ring
comp_1.2.0 uses VM inv eng 6 on hub 0
Oct 27 12:44:47 lars-laptop kernel: amdgpu 0000:c3:00.0: amdgpu: ring
comp_1.3.0 uses VM inv eng 7 on hub 0
Oct 27 12:44:47 lars-laptop kernel: amdgpu 0000:c3:00.0: amdgpu: ring
comp_1.0.1 uses VM inv eng 8 on hub 0
Oct 27 12:44:47 lars-laptop kernel: amdgpu 0000:c3:00.0: amdgpu: ring
comp_1.1.1 uses VM inv eng 9 on hub 0
Oct 27 12:44:47 lars-laptop kernel: amdgpu 0000:c3:00.0: amdgpu: ring
comp_1.2.1 uses VM inv eng 10 on hub 0
Oct 27 12:44:47 lars-laptop kernel: amdgpu 0000:c3:00.0: amdgpu: ring
comp_1.3.1 uses VM inv eng 11 on hub 0
Oct 27 12:44:47 lars-laptop kernel: amdgpu 0000:c3:00.0: amdgpu: ring
sdma0 uses VM inv eng 12 on hub 0
Oct 27 12:44:47 lars-laptop kernel: amdgpu 0000:c3:00.0: amdgpu: ring
vcn_unified_0 uses VM inv eng 0 on hub 8
Oct 27 12:44:47 lars-laptop kernel: amdgpu 0000:c3:00.0: amdgpu: ring
vcn_unified_1 uses VM inv eng 1 on hub 8
Oct 27 12:44:47 lars-laptop kernel: amdgpu 0000:c3:00.0: amdgpu: ring
jpeg_dec_0 uses VM inv eng 4 on hub 8
Oct 27 12:44:47 lars-laptop kernel: amdgpu 0000:c3:00.0: amdgpu: ring
jpeg_dec_1 uses VM inv eng 6 on hub 8
Oct 27 12:44:47 lars-laptop kernel: amdgpu 0000:c3:00.0: amdgpu: ring
mes_kiq_3.1.0 uses VM inv eng 13 on hub 0
Oct 27 12:44:47 lars-laptop kernel: amdgpu 0000:c3:00.0: amdgpu: ring
vpe uses VM inv eng 7 on hub 8
Oct 27 12:44:47 lars-laptop kernel: cs35l56-hda
i2c-CSC3554:00-cs35l54-hda.2: Calibration applied
Oct 27 12:44:47 lars-laptop kernel: cs35l56-hda
i2c-CSC3554:00-cs35l54-hda.0: Calibration applied
Oct 27 12:44:47 lars-laptop kernel: cs35l56-hda
i2c-CSC3554:00-cs35l54-hda.2: Tuning PID: 0x131118, SID: 0x360100,
TID: 0x80216
Oct 27 12:44:47 lars-laptop kernel: cs35l56-hda
i2c-CSC3554:00-cs35l54-hda.0: Tuning PID: 0x131118, SID: 0x360200,
TID: 0x80216
Oct 27 12:44:47 lars-laptop kernel: cs35l56-hda
i2c-CSC3554:00-cs35l54-hda.1: Calibration applied
Oct 27 12:44:47 lars-laptop kernel: cs35l56-hda
i2c-CSC3554:00-cs35l54-hda.3: Calibration applied
Oct 27 12:44:47 lars-laptop kernel: cs35l56-hda
i2c-CSC3554:00-cs35l54-hda.1: Tuning PID: 0x131118, SID: 0x360300,
TID: 0x80216
Oct 27 12:44:47 lars-laptop kernel: cs35l56-hda
i2c-CSC3554:00-cs35l54-hda.3: Tuning PID: 0x131118, SID: 0x360000,
TID: 0x80216
Oct 27 12:44:47 lars-laptop kernel: BUG: kernel NULL pointer
dereference, address: 00000000000003fc
Oct 27 12:44:47 lars-laptop kernel: #PF: supervisor read access in kernel m=
ode
Oct 27 12:44:47 lars-laptop kernel: #PF: error_code(0x0000) - not-present p=
age

Then I have to reboot. I'm happy to try more patches - but I have way
too little knowledge about any of this to be of any other help I'm
afraid.

Thanks,
Lars

On Mon, Oct 27, 2025 at 2:10=E2=80=AFPM Mario Limonciello <superm1@kernel.o=
rg> wrote:
>
> On 10/27/25 7:11 AM, Shyam Sundar S K wrote:
> >
> >
> > On 10/27/2025 16:42, Lars Francke wrote:
> >>> One way to be sure it's applied is to add a pr_info() message into th=
e
> >>> new function.  Then you'll know exactly when the new function is call=
ed
> >>> in the logs.
> >>>
> >>> But assuming that was in place then I feel this will still require so=
me
> >>> other coordination work with the PMF driver then too.
> >>
> >> I did that now, thanks for the hint.
> >> I added a pr_info to the sp_restore method but it is never printed.
> >> Just to confirm that I'm building and booting the right kernel I also
> >> added a debug line right before the "TEE enact" error:
> >>
> >> Oct 27 10:50:06 lars-laptop kernel: Lars patch worked
> >> Oct 27 10:50:06 lars-laptop kernel: amd-pmf AMDI0105:00: TEE enact cmd
> >> failed. err: ffff000e, ret:0
> >>
> >> In other words: I'm pretty certain I have your patch applied but
> >> sp_restore is never called which I think was the intention.
> >>
> >> I did play around a bit in the code but all I achieved are NULL
> >> pointer crashes :)
> >> It looks like "i2c_hid_core_pm" might be a typo/copy & paste error? I
> >> assume it should be "sp_pci_pm_ops"?
> >
> > Yes =E2=80=94 that should be sp_pci_pm_ops. Keep the pr_info in sp_rest=
ore();
> > if that log appears but the issue remains, the PMF driver will need to
> > be updated to support the .restore callback.
> >
>
> Yes; sorry about that.  If you need me to spin a new one, let me know.
>
> But I am still suspecting we're going to need PMF driver changes too
> because if the ring is not active then it's going to mean the TA wasn't
> running.

--0000000000005421df06422641a0
Content-Type: text/x-patch; charset="US-ASCII"; name="0001-tee-patch.patch"
Content-Disposition: attachment; filename="0001-tee-patch.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_mh9c22yi0>
X-Attachment-Id: f_mh9c22yi0

ZGlmZiAtLWdpdCBpL2RyaXZlcnMvY3J5cHRvL2NjcC9zcC1kZXYuYyB3L2RyaXZlcnMvY3J5cHRv
L2NjcC9zcC1kZXYuYwppbmRleCAzNDY3ZjZkYjRmNTAuLjZjYzk5MWIwMWFlMiAxMDA2NDQKLS0t
IGkvZHJpdmVycy9jcnlwdG8vY2NwL3NwLWRldi5jCisrKyB3L2RyaXZlcnMvY3J5cHRvL2NjcC9z
cC1kZXYuYwpAQCAtMjEsNiArMjEsNyBAQAogCiAjaW5jbHVkZSAic2V2LWRldi5oIgogI2luY2x1
ZGUgImNjcC1kZXYuaCIKKyNpbmNsdWRlICJ0ZWUtZGV2LmgiCiAjaW5jbHVkZSAic3AtZGV2Lmgi
CiAKIE1PRFVMRV9BVVRIT1IoIlRvbSBMZW5kYWNreSA8dGhvbWFzLmxlbmRhY2t5QGFtZC5jb20+
Iik7CkBAIC0yMzAsNiArMjMxLDE5IEBAIGludCBzcF9yZXN1bWUoc3RydWN0IHNwX2RldmljZSAq
c3ApCiAJcmV0dXJuIDA7CiB9CiAKK2ludCBzcF9yZXN0b3JlKHN0cnVjdCBzcF9kZXZpY2UgKnNw
KQoreworCXByX2luZm8oInNwX3Jlc3RvcmUgY2FsbGVkXG4iKTsKKwlpZiAoc3AtPmRldl92ZGF0
YS0+cHNwX3ZkYXRhLT50ZWUpIHsKKwkJaW50IHIgPSB0ZWVfcmVzdG9yZShzcC0+cHNwX2RhdGEp
OworCisJCWlmIChyKQorCQkJcmV0dXJuIHI7CisJfQorCXByX2luZm8oInNwX3Jlc3RvcmUgZG9u
ZVxuIik7CisJcmV0dXJuIHNwX3Jlc3VtZShzcCk7Cit9CisKIHN0cnVjdCBzcF9kZXZpY2UgKnNw
X2dldF9wc3BfbWFzdGVyX2RldmljZSh2b2lkKQogewogCXN0cnVjdCBzcF9kZXZpY2UgKmksICpy
ZXQgPSBOVUxMOwpkaWZmIC0tZ2l0IGkvZHJpdmVycy9jcnlwdG8vY2NwL3NwLWRldi5oIHcvZHJp
dmVycy9jcnlwdG8vY2NwL3NwLWRldi5oCmluZGV4IDZmOWQ3MDYzMjU3ZC4uMzdiMzhhZmFhYjE0
IDEwMDY0NAotLS0gaS9kcml2ZXJzL2NyeXB0by9jY3Avc3AtZGV2LmgKKysrIHcvZHJpdmVycy9j
cnlwdG8vY2NwL3NwLWRldi5oCkBAIC0xNDEsNiArMTQxLDcgQEAgdm9pZCBzcF9kZXN0cm95KHN0
cnVjdCBzcF9kZXZpY2UgKnNwKTsKIAogaW50IHNwX3N1c3BlbmQoc3RydWN0IHNwX2RldmljZSAq
c3ApOwogaW50IHNwX3Jlc3VtZShzdHJ1Y3Qgc3BfZGV2aWNlICpzcCk7CitpbnQgc3BfcmVzdG9y
ZShzdHJ1Y3Qgc3BfZGV2aWNlICpzcCk7CiBpbnQgc3BfcmVxdWVzdF9jY3BfaXJxKHN0cnVjdCBz
cF9kZXZpY2UgKnNwLCBpcnFfaGFuZGxlcl90IGhhbmRsZXIsCiAJCSAgICAgICBjb25zdCBjaGFy
ICpuYW1lLCB2b2lkICpkYXRhKTsKIHZvaWQgc3BfZnJlZV9jY3BfaXJxKHN0cnVjdCBzcF9kZXZp
Y2UgKnNwLCB2b2lkICpkYXRhKTsKZGlmZiAtLWdpdCBpL2RyaXZlcnMvY3J5cHRvL2NjcC9zcC1w
Y2kuYyB3L2RyaXZlcnMvY3J5cHRvL2NjcC9zcC1wY2kuYwppbmRleCBlN2JiODAzOTEyYTYuLjk4
YmIwZDc0YzhlYiAxMDA2NDQKLS0tIGkvZHJpdmVycy9jcnlwdG8vY2NwL3NwLXBjaS5jCisrKyB3
L2RyaXZlcnMvY3J5cHRvL2NjcC9zcC1wY2kuYwpAQCAtMzUzLDYgKzM1MywxMyBAQCBzdGF0aWMg
aW50IF9fbWF5YmVfdW51c2VkIHNwX3BjaV9yZXN1bWUoc3RydWN0IGRldmljZSAqZGV2KQogCXJl
dHVybiBzcF9yZXN1bWUoc3ApOwogfQogCitzdGF0aWMgaW50IF9fbWF5YmVfdW51c2VkIHNwX3Bj
aV9yZXN0b3JlKHN0cnVjdCBkZXZpY2UgKmRldikKK3sKKwlzdHJ1Y3Qgc3BfZGV2aWNlICpzcCA9
IGRldl9nZXRfZHJ2ZGF0YShkZXYpOworCisJcmV0dXJuIHNwX3Jlc3RvcmUoc3ApOworfQorCiAj
aWZkZWYgQ09ORklHX0NSWVBUT19ERVZfU1BfUFNQCiBzdGF0aWMgY29uc3Qgc3RydWN0IHNldl92
ZGF0YSBzZXZ2MSA9IHsKIAkuY21kcmVzcF9yZWcJCT0gMHgxMDU4MCwJLyogQzJQTVNHXzMyICov
CkBAIC01NDQsNyArNTUxLDE1IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgcGNpX2RldmljZV9pZCBz
cF9wY2lfdGFibGVbXSA9IHsKIH07CiBNT0RVTEVfREVWSUNFX1RBQkxFKHBjaSwgc3BfcGNpX3Rh
YmxlKTsKIAotc3RhdGljIFNJTVBMRV9ERVZfUE1fT1BTKHNwX3BjaV9wbV9vcHMsIHNwX3BjaV9z
dXNwZW5kLCBzcF9wY2lfcmVzdW1lKTsKKworY29uc3Qgc3RydWN0IGRldl9wbV9vcHMgc3BfcGNp
X3BtX29wcyA9IHsKKwkuc3VzcGVuZCA9IHBtX3NsZWVwX3B0cihzcF9wY2lfc3VzcGVuZCksCisJ
LnJlc3VtZSA9IHBtX3NsZWVwX3B0cihzcF9wY2lfcmVzdW1lKSwKKwkuZnJlZXplID0gcG1fc2xl
ZXBfcHRyKHNwX3BjaV9zdXNwZW5kKSwKKwkudGhhdyA9IHBtX3NsZWVwX3B0cihzcF9wY2lfcmVz
dW1lKSwKKwkucG93ZXJvZmYgPSBwbV9zbGVlcF9wdHIoc3BfcGNpX3N1c3BlbmQpLAorCS5yZXN0
b3JlID0gcG1fc2xlZXBfcHRyKHNwX3BjaV9yZXN0b3JlKSwKK307CiAKIHN0YXRpYyBzdHJ1Y3Qg
cGNpX2RyaXZlciBzcF9wY2lfZHJpdmVyID0gewogCS5uYW1lID0gImNjcCIsCmRpZmYgLS1naXQg
aS9kcml2ZXJzL2NyeXB0by9jY3AvdGVlLWRldi5jIHcvZHJpdmVycy9jcnlwdG8vY2NwL3RlZS1k
ZXYuYwppbmRleCA1ZTFkODA3MjQ2NzguLmE3NDcwNDc3MTE3ZCAxMDA2NDQKLS0tIGkvZHJpdmVy
cy9jcnlwdG8vY2NwL3RlZS1kZXYuYworKysgdy9kcml2ZXJzL2NyeXB0by9jY3AvdGVlLWRldi5j
CkBAIC0zNjUsMyArMzY1LDExIEBAIGludCBwc3BfY2hlY2tfdGVlX3N0YXR1cyh2b2lkKQogCXJl
dHVybiAwOwogfQogRVhQT1JUX1NZTUJPTChwc3BfY2hlY2tfdGVlX3N0YXR1cyk7CisKK2ludCB0
ZWVfcmVzdG9yZShzdHJ1Y3QgcHNwX2RldmljZSAqcHNwKQoreworCWlmICghcHNwIHx8ICFwc3At
PnRlZV9kYXRhKQorCQlyZXR1cm4gLUVOT0RFVjsKKworCXJldHVybiB0ZWVfaW5pdF9yaW5nKHBz
cC0+dGVlX2RhdGEpOworfQpcIE5vIG5ld2xpbmUgYXQgZW5kIG9mIGZpbGUKZGlmZiAtLWdpdCBp
L2RyaXZlcnMvY3J5cHRvL2NjcC90ZWUtZGV2Lmggdy9kcml2ZXJzL2NyeXB0by9jY3AvdGVlLWRl
di5oCmluZGV4IGVhOWEyYjdjMDVmNS4uYzIzNDE2Y2I3YmIzIDEwMDY0NAotLS0gaS9kcml2ZXJz
L2NyeXB0by9jY3AvdGVlLWRldi5oCisrKyB3L2RyaXZlcnMvY3J5cHRvL2NjcC90ZWUtZGV2LmgK
QEAgLTExMSw1ICsxMTEsNiBAQCBzdHJ1Y3QgdGVlX3JpbmdfY21kIHsKIAogaW50IHRlZV9kZXZf
aW5pdChzdHJ1Y3QgcHNwX2RldmljZSAqcHNwKTsKIHZvaWQgdGVlX2Rldl9kZXN0cm95KHN0cnVj
dCBwc3BfZGV2aWNlICpwc3ApOworaW50IHRlZV9yZXN0b3JlKHN0cnVjdCBwc3BfZGV2aWNlICpw
c3ApOwogCiAjZW5kaWYgLyogX19URUVfREVWX0hfXyAqLwo=
--0000000000005421df06422641a0--
