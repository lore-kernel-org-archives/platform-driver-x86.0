Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com [209.85.210.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B050014A093
	for <platform-driver-x86@vger.kernel.org>; Fri, 20 Sep 2024 16:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726848967; cv=none; b=MPTItxAM/ErA9HVg0Hkq5/zLwtAMDOmWEKmfma737VH9xKXTRNhmFt4ZqiF/THjjk66JfbFOaBb0cDwS9gO0eV2iaPF4jTL1lmYXdJrWecvoDPCCkM+k03GyGjsDgbFVCDnKWzUzvDZZvRRQCTSxVTc13SIfftVvednux5TxgSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726848967; c=relaxed/simple;
	bh=A9L5svSyUafh+goXrUer7EzWEzBuEFa/GdCR83nL7s4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aE3F+QyGcbdupzBUyDn9+5TGuR6elxgXxX0V6+eAv00rrMSNMA6kB63vL4WK+3weyY8ws93YjJtrmEbdDjItquobs4RdMUZe5dzLtZNlvT2NnmeEaS7zV0DytrvcRqQ03fU6iKIINxOIkrLGMGsBNmsjJU8TFwv3OtiotK6LD9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BoruZoov; arc=none smtp.client-ip=209.85.210.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BoruZoov"
Received: by mail-pf1-f196.google.com with SMTP id d2e1a72fcca58-718d8d6af8fso1618852b3a.3
        for <platform-driver-x86@vger.kernel.org>; Fri, 20 Sep 2024 09:16:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726848965; x=1727453765; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gHvx0+e/Y8SOs1PF3a9F5E4G+x/e4DiUko6j2n0Or4I=;
        b=BoruZoovw8NUElJR0DZfClAfV/OtPgK15ZFLnuPOjvbr7swVdmpY9A206RHaDy8WD8
         bSirxhJQB7qkyVxbWr9pEqYKXtkukfHKsBqYGFxpupv1eX1iAss1aFllpFKh31UxKhxM
         un/uh3PZy/qM1nyvnj6gGmhdq2oqT/cWiDhW1nDWkv76lKl1AS/wgb/kv/3GaTrSwrfw
         eQ79WcGPPsQbNX0qqg1hlqIbUdjARSPqIfSQU7gtWoEW4h+QfJ7+Zpc5ZUgzvRXQb5ny
         an7xgZlRLOiyb32BndYaLmX1D1laPX0R3LkXsfqrr+pcsTPBXLjSXPaW/jSvR7rlQJtz
         eDJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726848965; x=1727453765;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gHvx0+e/Y8SOs1PF3a9F5E4G+x/e4DiUko6j2n0Or4I=;
        b=RJnC177pG6UYTwEJZSRLAKp3VoIgh5Z2XvMqyuXPO4UUu2fRrb7Znq3nVqQBEMsXBu
         1JNHFs3lRzIdVzWKjMqdMREu7NZwp1RqZFxFRsw2GqsCOzyh6JDYnmo1cMGopbs1lyIt
         0dZlSCy87z0Y904LFiGJe/DYnlbonkOTOpNpbWTKNY0MYJVYW0EjipUsvca4N6lThLWa
         l2O4GcZkh+m9L1TQWzZuVeWCB9TazsAkVrUfrIaK4gAWf9nBjUsKGLoFYnytTO6WQJrC
         W2ko9W5NhVkDl3hGKHYtwQ3nWxF+KZGogbVj2bRUe1YDtlOBYTkpbrb0CqpOfxNtKnxC
         l25A==
X-Gm-Message-State: AOJu0YzKLgVKlt5NjUzXjTpN/JauOrdmIcIF6RSGB28pyXzkCnRUkaCE
	P+DfZAEu2hT9GoRfVtO8WGVDQHI+Rw4o7lCWoPL9yB6/JD1DPV/Xx1dTtCd2cFk=
X-Google-Smtp-Source: AGHT+IG1P3p7QuPNrTIhknHkRoM6zba1R+McYQkxY2/G++2XHDE/IYDmrWShEzTM0kBQ4d0urNEoIQ==
X-Received: by 2002:a05:6a21:3946:b0:1d2:eadb:bb2a with SMTP id adf61e73a8af0-1d30a94b329mr4734268637.30.1726848964917;
        Fri, 20 Sep 2024 09:16:04 -0700 (PDT)
Received: from [198.18.0.1] (n220246094186.netvigator.com. [220.246.94.186])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71944bc7bb5sm10025566b3a.207.2024.09.20.09.16.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Sep 2024 09:16:04 -0700 (PDT)
Message-ID: <9b0f7445-c768-4f0f-a46a-b1c022f5e6b3@gmail.com>
Date: Sat, 21 Sep 2024 00:16:02 +0800
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: ISST: Fix the KASAN report
 slab-out-of-bounds bug
To: srinivas pandruvada <srinivas.pandruvada@linux.intel.com>,
 hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org
References: <20240917180350.4061-1-zachwade.k@gmail.com>
 <c983ec3aeefcabc080f51958eb11275c84bb9506.camel@linux.intel.com>
 <10f32b33-4c41-44a0-8f37-3cd1ae68a6ed@gmail.com>
 <c9f3758e027e06aaf5776904d6e7a0de0bf916c2.camel@linux.intel.com>
 <8b83c925-17d2-47e1-a278-998c229c02f1@gmail.com>
 <422bfc19243e8d50fc3c847f0c1db01e703aff4e.camel@linux.intel.com>
From: Zach Wade <zachwade.k@gmail.com>
In-Reply-To: <422bfc19243e8d50fc3c847f0c1db01e703aff4e.camel@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2024/9/20 2:37, srinivas pandruvada wrote:
> On Fri, 2024-09-20 at 00:22 +0800, Zach Wade wrote:
>>
>>
>>
> Hi Wade,
> 
> 
> ...
> ...
> 
> What is
> sudo lspci -vvv

Hi Pandruvada,

The command output is as follows:
lspci -vvv
00:00.0 Host bridge: Intel Corporation 440BX/ZX/DX - 82443BX/ZX/DX Host 
bridge (rev 01)
         Subsystem: VMware Virtual Machine Chipset
         Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- 
ParErr- Stepping- SERR- FastB2B- DisINTx-
         Status: Cap- 66MHz- UDF- FastB2B- ParErr- DEVSEL=medium 
 >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
         Latency: 0

00:01.0 PCI bridge: Intel Corporation 440BX/ZX/DX - 82443BX/ZX/DX AGP 
bridge (rev 01) (prog-if 00 [Normal decode])
         Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV+ VGASnoop- 
ParErr- Stepping- SERR- FastB2B- DisINTx-
         Status: Cap- 66MHz+ UDF- FastB2B- ParErr- DEVSEL=medium 
 >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
         Latency: 0
         Bus: primary=00, secondary=01, subordinate=01, sec-latency=0
         I/O behind bridge: f000-0fff [disabled] [16-bit]
         Memory behind bridge: fff00000-000fffff [disabled] [32-bit]
         Prefetchable memory behind bridge: fff00000-000fffff [disabled] 
[32-bit]
         Secondary status: 66MHz+ FastB2B+ ParErr- DEVSEL=medium 
 >TAbort- <TAbort- <MAbort- <SERR- <PERR-
         BridgeCtl: Parity- SERR- NoISA- VGA- VGA16- MAbort- >Reset- 
FastB2B-
                 PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-

00:07.0 ISA bridge: Intel Corporation 82371AB/EB/MB PIIX4 ISA (rev 08)
         Subsystem: VMware Virtual Machine Chipset
         Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- 
ParErr- Stepping- SERR- FastB2B- DisINTx-
         Status: Cap- 66MHz- UDF- FastB2B+ ParErr- DEVSEL=medium 
 >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
         Latency: 0

00:07.1 IDE interface: Intel Corporation 82371AB/EB/MB PIIX4 IDE (rev 
01) (prog-if 8a [ISA Compatibility mode controller, supports both 
channels switched to PCI native mode, supports bus mastering])
         Subsystem: VMware Virtual Machine Chipset
         Control: I/O+ Mem- BusMaster+ SpecCycle- MemWINV- VGASnoop- 
ParErr- Stepping- SERR- FastB2B- DisINTx-
         Status: Cap- 66MHz- UDF- FastB2B+ ParErr- DEVSEL=medium 
 >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
         Latency: 64
         Region 0: I/O ports at 01f0 [size=8]
         Region 1: I/O ports at 03f4
         Region 2: I/O ports at 0170 [size=8]
         Region 3: I/O ports at 0374
         Region 4: I/O ports at 0850 [size=16]
         Kernel driver in use: ata_piix
         Kernel modules: pata_acpi, ata_generic

00:07.3 Bridge: Intel Corporation 82371AB/EB/MB PIIX4 ACPI (rev 08)
         Subsystem: VMware Virtual Machine Chipset
         Control: I/O- Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- 
ParErr- Stepping- SERR- FastB2B- DisINTx-
         Status: Cap- 66MHz- UDF- FastB2B+ ParErr- DEVSEL=medium 
 >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
         Interrupt: pin ? routed to IRQ 9
         Kernel modules: i2c_piix4

00:07.7 System peripheral: VMware Virtual Machine Communication 
Interface (rev 10)
         Subsystem: VMware Virtual Machine Communication Interface
         Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- 
ParErr- Stepping- SERR- FastB2B- DisINTx+
         Status: Cap+ 66MHz- UDF- FastB2B+ ParErr- DEVSEL=medium 
 >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
         Latency: 64 (1500ns min, 63750ns max)
         Interrupt: pin A routed to IRQ 16
         Region 0: I/O ports at 0800 [size=64]
         Region 1: Memory at ffbc0000 (64-bit, non-prefetchable) [size=256K]
         Capabilities: [40] MSI: Enable- Count=1/1 Maskable- 64bit+
                 Address: 0000000000000000  Data: 0000
         Capabilities: [58] MSI-X: Enable+ Count=3 Masked-
                 Vector table: BAR=1 offset=00000000
                 PBA: BAR=1 offset=00010000
         Kernel driver in use: vmw_vmci
         Kernel modules: vmw_vmci

00:0f.0 VGA compatible controller: VMware SVGA II Adapter (prog-if 00 
[VGA controller])
         Subsystem: VMware SVGA II Adapter
         Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- 
ParErr- Stepping- SERR- FastB2B- DisINTx-
         Status: Cap+ 66MHz- UDF- FastB2B+ ParErr- DEVSEL=medium 
 >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
         Latency: 64, Cache Line Size: 32 bytes
         Interrupt: pin A routed to IRQ 16
         Region 0: I/O ports at 0840 [size=16]
         Region 1: Memory at f0000000 (32-bit, prefetchable) [size=128M]
         Region 2: Memory at ff000000 (32-bit, non-prefetchable) [size=8M]
         Expansion ROM at 000c0000 [disabled] [size=128K]
         Capabilities: [40] Vendor Specific Information: Len=00 <?>
         Capabilities: [44] PCI Advanced Features
                 AFCap: TP+ FLR+
                 AFCtrl: FLR-
                 AFStatus: TP-
         Kernel driver in use: vmwgfx
         Kernel modules: vmwgfx

02:00.0 Serial Attached SCSI controller: VMware PVSCSI SCSI Controller 
(rev 02)
         DeviceName: SCSI0
         Subsystem: VMware PVSCSI SCSI Controller
         Physical Slot: 32
         Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- 
ParErr- Stepping- SERR- FastB2B- DisINTx+
         Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- 
<TAbort- <MAbort- >SERR- <PERR- INTx-
         Latency: 0
         Interrupt: pin A routed to IRQ 17
         Region 0: I/O ports at 0a30 [size=8]
         Region 1: Memory at ffbb0000 (64-bit, non-prefetchable) [size=32K]
         Expansion ROM at fdd00000 [disabled] [size=64K]
         Capabilities: [40] Express (v2) Endpoint, IntMsgNum 0
                 DevCap: MaxPayload 128 bytes, PhantFunc 0, Latency L0s 
<64ns, L1 <1us
                         ExtTag- AttnBtn- AttnInd- PwrInd- RBE- FLReset+ 
SlotPowerLimit 0W
                 DevCtl: CorrErr- NonFatalErr- FatalErr- UnsupReq-
                         RlxdOrd- ExtTag- PhantFunc- AuxPwr- NoSnoop- 
FLReset-
                         MaxPayload 128 bytes, MaxReadReq 128 bytes
                 DevSta: CorrErr- NonFatalErr- FatalErr- UnsupReq- 
AuxPwr- TransPend-
                 LnkCap: Port #0, Speed 5GT/s, Width x32, ASPM L0s, Exit 
Latency L0s <64ns
                         ClockPM- Surprise- LLActRep- BwNot- ASPMOptComp-
                 LnkCtl: ASPM Disabled; RCB 64 bytes, LnkDisable- CommClk-
                         ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
                 LnkSta: Speed 5GT/s, Width x32
                         TrErr- Train- SlotClk- DLActive- BWMgmt- ABWMgmt-
                 DevCap2: Completion Timeout: Not Supported, TimeoutDis- 
NROPrPrP- LTR-
                          10BitTagComp- 10BitTagReq- OBFF Not Supported, 
ExtFmt- EETLPPrefix-
                          EmergencyPowerReduction Not Supported, 
EmergencyPowerReductionInit-
                          FRS- TPHComp- ExtTPHComp-
                          AtomicOpsCap: 32bit- 64bit- 128bitCAS-
                 DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-
                          AtomicOpsCtl: ReqEn-
                          IDOReq- IDOCompl- LTR- EmergencyPowerReductionReq-
                          10BitTagReq- OBFF Disabled, EETLPPrefixBlk-
                 LnkCtl2: Target Link Speed: 2.5GT/s, EnterCompliance- 
SpeedDis-
                          Transmit Margin: Normal Operating Range, 
EnterModifiedCompliance- ComplianceSOS-
                          Compliance Preset/De-emphasis: -6dB 
de-emphasis, 0dB preshoot
                 LnkSta2: Current De-emphasis Level: -6dB, 
EqualizationComplete- EqualizationPhase1-
                          EqualizationPhase2- EqualizationPhase3- 
LinkEqualizationRequest-
                          Retimer- 2Retimers- CrosslinkRes: unsupported
         Capabilities: [7c] MSI: Enable- Count=1/1 Maskable- 64bit+
                 Address: 0000000000000000  Data: 0000
         Capabilities: [94] Power Management version 3
                 Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA 
PME(D0+,D1-,D2-,D3hot+,D3cold+)
                 Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
         Capabilities: [9c] MSI-X: Enable+ Count=24 Masked-
                 Vector table: BAR=1 offset=00006000
                 PBA: BAR=1 offset=00007000
         Capabilities: [100 v1] Device Serial Number c0-45-4f-c0-50-05-05-68
         Kernel driver in use: vmw_pvscsi
         Kernel modules: vmw_pvscsi

02:01.0 USB controller: VMware USB1.1 UHCI Controller (prog-if 00 [UHCI])
         DeviceName: usb
         Subsystem: VMware Device 1976
         Physical Slot: 33
         Control: I/O+ Mem- BusMaster+ SpecCycle- MemWINV- VGASnoop- 
ParErr- Stepping- SERR- FastB2B- DisINTx-
         Status: Cap+ 66MHz- UDF- FastB2B+ ParErr- DEVSEL=medium 
 >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
         Latency: 64
         Interrupt: pin A routed to IRQ 18
         Region 4: I/O ports at 0a00 [size=32]
         Capabilities: [40] PCI Advanced Features
                 AFCap: TP+ FLR+
                 AFCtrl: FLR-
                 AFStatus: TP-
         Kernel driver in use: uhci_hcd

02:02.0 Ethernet controller: VMware VMXNET3 Ethernet Controller (rev 01)
         DeviceName: Ethernet0
         Subsystem: VMware VMXNET3 Ethernet Controller
         Physical Slot: 34
         Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- 
ParErr- Stepping- SERR- FastB2B- DisINTx+
         Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- 
<TAbort- <MAbort- >SERR- <PERR- INTx-
         Latency: 0, Cache Line Size: 32 bytes
         Interrupt: pin A routed to IRQ 19
         Region 0: Memory at fe243000 (32-bit, non-prefetchable) [size=4K]
         Region 1: Memory at fe242000 (32-bit, non-prefetchable) [size=4K]
         Region 2: Memory at fe240000 (32-bit, non-prefetchable) [size=8K]
         Region 3: I/O ports at 0a20 [size=16]
         Expansion ROM at fdd10000 [disabled] [size=64K]
         Capabilities: [40] Power Management version 3
                 Flags: PMEClk- DSI- D1+ D2+ AuxCurrent=0mA 
PME(D0+,D1+,D2+,D3hot+,D3cold+)
                 Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
         Capabilities: [48] Express (v2) Endpoint, IntMsgNum 0
                 DevCap: MaxPayload 128 bytes, PhantFunc 0, Latency L0s 
<64ns, L1 <1us
                         ExtTag- AttnBtn- AttnInd- PwrInd- RBE- FLReset- 
SlotPowerLimit 0W
                 DevCtl: CorrErr- NonFatalErr- FatalErr- UnsupReq-
                         RlxdOrd- ExtTag- PhantFunc- AuxPwr- NoSnoop-
                         MaxPayload 128 bytes, MaxReadReq 128 bytes
                 DevSta: CorrErr- NonFatalErr- FatalErr- UnsupReq- 
AuxPwr- TransPend-
                 LnkCap: Port #0, Speed 5GT/s, Width x32, ASPM L0s, Exit 
Latency L0s <64ns
                         ClockPM- Surprise- LLActRep- BwNot- ASPMOptComp-
                 LnkCtl: ASPM Disabled; RCB 64 bytes, LnkDisable- CommClk-
                         ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
                 LnkSta: Speed 5GT/s, Width x32
                         TrErr- Train- SlotClk- DLActive- BWMgmt- ABWMgmt-
                 DevCap2: Completion Timeout: Not Supported, TimeoutDis- 
NROPrPrP- LTR-
                          10BitTagComp- 10BitTagReq- OBFF Not Supported, 
ExtFmt- EETLPPrefix-
                          EmergencyPowerReduction Not Supported, 
EmergencyPowerReductionInit-
                          FRS- TPHComp- ExtTPHComp-
                          AtomicOpsCap: 32bit- 64bit- 128bitCAS-
                 DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-
                          AtomicOpsCtl: ReqEn-
                          IDOReq- IDOCompl- LTR- EmergencyPowerReductionReq-
                          10BitTagReq- OBFF Disabled, EETLPPrefixBlk-
                 LnkSta2: Current De-emphasis Level: -6dB, 
EqualizationComplete- EqualizationPhase1-
                          EqualizationPhase2- EqualizationPhase3- 
LinkEqualizationRequest-
                          Retimer- 2Retimers- CrosslinkRes: unsupported
         Capabilities: [84] MSI: Enable- Count=1/1 Maskable- 64bit+
                 Address: 0000000000000000  Data: 0000
         Capabilities: [9c] MSI-X: Enable+ Count=65 Masked-
                 Vector table: BAR=2 offset=00000000
                 PBA: BAR=2 offset=00001000
         Capabilities: [100 v1] Device Serial Number 00-0c-29-ff-ff-8c-20-03
         Kernel driver in use: vmxnet3
         Kernel modules: vmxnet3

02:03.0 USB controller: VMware USB2 EHCI Controller (prog-if 20 [EHCI])
         DeviceName: ehci
         Subsystem: VMware USB2 EHCI Controller
         Physical Slot: 35
         Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- 
ParErr- Stepping- SERR- FastB2B- DisINTx-
         Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- 
<TAbort- <MAbort- >SERR- <PERR- INTx-
         Latency: 64 (1500ns min, 63750ns max)
         Interrupt: pin A routed to IRQ 16
         Region 0: Memory at fe211000 (32-bit, non-prefetchable) [size=4K]
         Capabilities: [40] PCI Advanced Features
                 AFCap: TP+ FLR+
                 AFCtrl: FLR-
                 AFStatus: TP-
         Kernel driver in use: ehci-pci

02:04.0 SATA controller: VMware SATA AHCI controller (prog-if 01 [AHCI 1.0])
         DeviceName: sata0
         Subsystem: VMware SATA AHCI controller
         Physical Slot: 36
         Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- 
ParErr- Stepping- SERR- FastB2B- DisINTx+
         Status: Cap+ 66MHz+ UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- 
<TAbort- <MAbort- >SERR- <PERR- INTx-
         Latency: 64
         Interrupt: pin A routed to IRQ 24
         Region 5: Memory at fe210000 (32-bit, non-prefetchable) [size=4K]
         Expansion ROM at fdd20000 [disabled] [size=64K]
         Capabilities: [40] Power Management version 3
                 Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA 
PME(D0-,D1-,D2-,D3hot+,D3cold-)
                 Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
         Capabilities: [48] MSI: Enable+ Count=1/1 Maskable- 64bit+
                 Address: 00000000fee04000  Data: 0020
         Capabilities: [60] SATA HBA v1.0 InCfgSpace
         Capabilities: [70] PCI Advanced Features
                 AFCap: TP+ FLR+
                 AFCtrl: FLR-
                 AFStatus: TP-
         Kernel driver in use: ahci

> Also cat /proc/cpuinfo?
> 

Since there are 32 cores, the output is quite long, so I omitted the 
repeated parts to keep the email short:
cat /proc/cpuinfo
processor       : 0
vendor_id       : GenuineIntel
cpu family      : 6
model           : 85
model name      : Intel(R) Xeon(R) Gold 6226R CPU @ 2.90GHz
stepping        : 7
microcode       : 0x5003302
cpu MHz         : 2893.202
cache size      : 22528 KB
physical id     : 0
siblings        : 1
core id         : 0
cpu cores       : 1
apicid          : 0
initial apicid  : 0
fpu             : yes
fpu_exception   : yes
cpuid level     : 22
wp              : yes
flags           : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge 
mca cmov pat pse36 clflush mmx fxsr sse sse2 ss syscall nx pdpe1gb 
rdtscp lm constant_tsc arch_perfmon nopl xtopology tsc_reliable 
nonstop_tsc cpuid tsc_known_freq pni pclmulqdq ssse3 fma cx16 pcid 
sse4_1 sse4_2 x2apic movbe popcnt tsc_deadline_timer aes xsave avx f16c 
rdrand hypervisor lahf_lm abm 3dnowprefetch ssbd ibrs ibpb stibp 
ibrs_enhanced fsgsbase tsc_adjust bmi1 avx2 smep bmi2 invpcid avx512f 
avx512dq rdseed adx smap clflushopt clwb avx512cd avx512bw avx512vl 
xsaveopt xsavec xgetbv1 xsaves arat pku ospke avx512_vnni md_clear 
flush_l1d arch_capabilities
bugs            : spectre_v1 spectre_v2 spec_store_bypass swapgs 
itlb_multihit mmio_stale_data retbleed eibrs_pbrsb gds bhi
bogomips        : 5786.40
clflush size    : 64
cache_alignment : 64
address sizes   : 45 bits physical, 48 bits virtual
power management:

processor       : 1
vendor_id       : GenuineIntel
cpu family      : 6
model           : 85
model name      : Intel(R) Xeon(R) Gold 6226R CPU @ 2.90GHz
stepping        : 7
microcode       : 0x5003302
cpu MHz         : 2893.202
cache size      : 22528 KB
physical id     : 2
siblings        : 1
core id         : 0
cpu cores       : 1
apicid          : 2
initial apicid  : 2
fpu             : yes
fpu_exception   : yes
cpuid level     : 22
wp              : yes
flags           : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge 
mca cmov pat pse36 clflush mmx fxsr sse sse2 ss syscall nx pdpe1gb 
rdtscp lm constant_tsc arch_perfmon nopl xtopology tsc_reliable 
nonstop_tsc cpuid tsc_known_freq pni pclmulqdq ssse3 fma cx16 pcid 
sse4_1 sse4_2 x2apic movbe popcnt tsc_deadline_timer aes xsave avx f16c 
rdrand hypervisor lahf_lm abm 3dnowprefetch ssbd ibrs ibpb stibp 
ibrs_enhanced fsgsbase tsc_adjust bmi1 avx2 smep bmi2 invpcid avx512f 
avx512dq rdseed adx smap clflushopt clwb avx512cd avx512bw avx512vl 
xsaveopt xsavec xgetbv1 xsaves arat pku ospke avx512_vnni md_clear 
flush_l1d arch_capabilities
bugs            : spectre_v1 spectre_v2 spec_store_bypass swapgs 
itlb_multihit mmio_stale_data retbleed eibrs_pbrsb gds bhi
bogomips        : 5786.40
clflush size    : 64
cache_alignment : 64
address sizes   : 45 bits physical, 48 bits virtual
power management:

processor       : 2
vendor_id       : GenuineIntel
cpu family      : 6
model           : 85
model name      : Intel(R) Xeon(R) Gold 6226R CPU @ 2.90GHz
stepping        : 7
microcode       : 0x5003302
cpu MHz         : 2893.202
cache size      : 22528 KB
physical id     : 4
siblings        : 1
core id         : 0
cpu cores       : 1
apicid          : 4
initial apicid  : 4
fpu             : yes
fpu_exception   : yes
cpuid level     : 22
wp              : yes
flags           : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge 
mca cmov pat pse36 clflush mmx fxsr sse sse2 ss syscall nx pdpe1gb 
rdtscp lm constant_tsc arch_perfmon nopl xtopology tsc_reliable 
nonstop_tsc cpuid tsc_known_freq pni pclmulqdq ssse3 fma cx16 pcid 
sse4_1 sse4_2 x2apic movbe popcnt tsc_deadline_timer aes xsave avx f16c 
rdrand hypervisor lahf_lm abm 3dnowprefetch ssbd ibrs ibpb stibp 
ibrs_enhanced fsgsbase tsc_adjust bmi1 avx2 smep bmi2 invpcid avx512f 
avx512dq rdseed adx smap clflushopt clwb avx512cd avx512bw avx512vl 
xsaveopt xsavec xgetbv1 xsaves arat pku ospke avx512_vnni md_clear 
flush_l1d arch_capabilities
bugs            : spectre_v1 spectre_v2 spec_store_bypass swapgs 
itlb_multihit mmio_stale_data retbleed eibrs_pbrsb gds bhi
bogomips        : 5786.40
clflush size    : 64
cache_alignment : 64
address sizes   : 45 bits physical, 48 bits virtual
power management:

processor       : 3
vendor_id       : GenuineIntel
cpu family      : 6
model           : 85
model name      : Intel(R) Xeon(R) Gold 6226R CPU @ 2.90GHz
stepping        : 7
microcode       : 0x5003302
cpu MHz         : 2893.202
cache size      : 22528 KB
physical id     : 6
siblings        : 1
core id         : 0
cpu cores       : 1
apicid          : 6
initial apicid  : 6
fpu             : yes
fpu_exception   : yes
cpuid level     : 22
wp              : yes
flags           : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge 
mca cmov pat pse36 clflush mmx fxsr sse sse2 ss syscall nx pdpe1gb 
rdtscp lm constant_tsc arch_perfmon nopl xtopology tsc_reliable 
nonstop_tsc cpuid tsc_known_freq pni pclmulqdq ssse3 fma cx16 pcid 
sse4_1 sse4_2 x2apic movbe popcnt tsc_deadline_timer aes xsave avx f16c 
rdrand hypervisor lahf_lm abm 3dnowprefetch ssbd ibrs ibpb stibp 
ibrs_enhanced fsgsbase tsc_adjust bmi1 avx2 smep bmi2 invpcid avx512f 
avx512dq rdseed adx smap clflushopt clwb avx512cd avx512bw avx512vl 
xsaveopt xsavec xgetbv1 xsaves arat pku ospke avx512_vnni md_clear 
flush_l1d arch_capabilities
bugs            : spectre_v1 spectre_v2 spec_store_bypass swapgs 
itlb_multihit mmio_stale_data retbleed eibrs_pbrsb gds bhi
bogomips        : 5786.40
clflush size    : 64
cache_alignment : 64
address sizes   : 45 bits physical, 48 bits virtual
power management:

......

processor       : 29
vendor_id       : GenuineIntel
cpu family      : 6
model           : 85
model name      : Intel(R) Xeon(R) Gold 6226R CPU @ 2.90GHz
stepping        : 7
microcode       : 0x5003302
cpu MHz         : 2893.202
cache size      : 22528 KB
physical id     : 58
siblings        : 1
core id         : 0
cpu cores       : 1
apicid          : 58
initial apicid  : 58
fpu             : yes
fpu_exception   : yes
cpuid level     : 22
wp              : yes
flags           : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge 
mca cmov pat pse36 clflush mmx fxsr sse sse2 ss syscall nx pdpe1gb 
rdtscp lm constant_tsc arch_perfmon nopl xtopology tsc_reliable 
nonstop_tsc cpuid tsc_known_freq pni pclmulqdq ssse3 fma cx16 pcid 
sse4_1 sse4_2 x2apic movbe popcnt tsc_deadline_timer aes xsave avx f16c 
rdrand hypervisor lahf_lm abm 3dnowprefetch ssbd ibrs ibpb stibp 
ibrs_enhanced fsgsbase tsc_adjust bmi1 avx2 smep bmi2 invpcid avx512f 
avx512dq rdseed adx smap clflushopt clwb avx512cd avx512bw avx512vl 
xsaveopt xsavec xgetbv1 xsaves arat pku ospke avx512_vnni md_clear 
flush_l1d arch_capabilities
bugs            : spectre_v1 spectre_v2 spec_store_bypass swapgs 
itlb_multihit mmio_stale_data retbleed eibrs_pbrsb gds bhi
bogomips        : 5786.40
clflush size    : 64
cache_alignment : 64
address sizes   : 45 bits physical, 48 bits virtual
power management:

processor       : 30
vendor_id       : GenuineIntel
cpu family      : 6
model           : 85
model name      : Intel(R) Xeon(R) Gold 6226R CPU @ 2.90GHz
stepping        : 7
microcode       : 0x5003302
cpu MHz         : 2893.202
cache size      : 22528 KB
physical id     : 60
siblings        : 1
core id         : 0
cpu cores       : 1
apicid          : 60
initial apicid  : 60
fpu             : yes
fpu_exception   : yes
cpuid level     : 22
wp              : yes
flags           : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge 
mca cmov pat pse36 clflush mmx fxsr sse sse2 ss syscall nx pdpe1gb 
rdtscp lm constant_tsc arch_perfmon nopl xtopology tsc_reliable 
nonstop_tsc cpuid tsc_known_freq pni pclmulqdq ssse3 fma cx16 pcid 
sse4_1 sse4_2 x2apic movbe popcnt tsc_deadline_timer aes xsave avx f16c 
rdrand hypervisor lahf_lm abm 3dnowprefetch ssbd ibrs ibpb stibp 
ibrs_enhanced fsgsbase tsc_adjust bmi1 avx2 smep bmi2 invpcid avx512f 
avx512dq rdseed adx smap clflushopt clwb avx512cd avx512bw avx512vl 
xsaveopt xsavec xgetbv1 xsaves arat pku ospke avx512_vnni md_clear 
flush_l1d arch_capabilities
bugs            : spectre_v1 spectre_v2 spec_store_bypass swapgs 
itlb_multihit mmio_stale_data retbleed eibrs_pbrsb gds bhi
bogomips        : 5786.40
clflush size    : 64
cache_alignment : 64
address sizes   : 45 bits physical, 48 bits virtual
power management:

processor       : 31
vendor_id       : GenuineIntel
cpu family      : 6
model           : 85
model name      : Intel(R) Xeon(R) Gold 6226R CPU @ 2.90GHz
stepping        : 7
microcode       : 0x5003302
cpu MHz         : 2893.202
cache size      : 22528 KB
physical id     : 62
siblings        : 1
core id         : 0
cpu cores       : 1
apicid          : 62
initial apicid  : 62
fpu             : yes
fpu_exception   : yes
cpuid level     : 22
wp              : yes
flags           : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge 
mca cmov pat pse36 clflush mmx fxsr sse sse2 ss syscall nx pdpe1gb 
rdtscp lm constant_tsc arch_perfmon nopl xtopology tsc_reliable 
nonstop_tsc cpuid tsc_known_freq pni pclmulqdq ssse3 fma cx16 pcid 
sse4_1 sse4_2 x2apic movbe popcnt tsc_deadline_timer aes xsave avx f16c 
rdrand hypervisor lahf_lm abm 3dnowprefetch ssbd ibrs ibpb stibp 
ibrs_enhanced fsgsbase tsc_adjust bmi1 avx2 smep bmi2 invpcid avx512f 
avx512dq rdseed adx smap clflushopt clwb avx512cd avx512bw avx512vl 
xsaveopt xsavec xgetbv1 xsaves arat pku ospke avx512_vnni md_clear 
flush_l1d arch_capabilities
bugs            : spectre_v1 spectre_v2 spec_store_bypass swapgs 
itlb_multihit mmio_stale_data retbleed eibrs_pbrsb gds bhi
bogomips        : 5786.40
clflush size    : 64
cache_alignment : 64
address sizes   : 45 bits physical, 48 bits virtual
power management:


> Thanks,
> Srinivas
> 
>>
>>> I don't think lspci in VM will show this device.
>>> Can you send lspci -k?
>>
>> lspci -k
>> 00:00.0 Host bridge: Intel Corporation 440BX/ZX/DX - 82443BX/ZX/DX
>> Host
>> ...
 >> ...
>>           Kernel driver in use: ehci-pci
>> 02:04.0 SATA controller: VMware SATA AHCI controller
>>           DeviceName: sata0
>>           Subsystem: VMware SATA AHCI controller
>>           Kernel driver in use: ahci
>>
>>>
> This is not complete list.

As requested, the full output of lspci -k is documented above.

Thanks,
Zach

> 
> 
>>> I want to make sure somehow your other VM PCI device is using same
>>> ID
>> ...
>> ...
> 

