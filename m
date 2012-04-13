From: Martin Mokrejs <mmokrejs@fold.natur.cuni.cz>
Subject: Re: 3.4.0-rc2: Oops on Dell Vostro 3550 in dmi_matches()
Date: Sat, 14 Apr 2012 00:47:09 +0200
Message-ID: <4F88ACED.9000205@fold.natur.cuni.cz>
References: <4F887E0D.4030501@fold.natur.cuni.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from fold.natur.cuni.cz ([195.113.57.32]:51183 "HELO
	fold.natur.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1753562Ab2DMWrO (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 13 Apr 2012 18:47:14 -0400
In-Reply-To: <4F887E0D.4030501@fold.natur.cuni.cz>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: mjg59@srcf.ucam.org, platform-driver-x86@vger.kernel.org

Martin Mokrejs wrote:
> Hi,
>   I just tried to boot 3.4-rc2 kernel but it oopses very quickly, and always
> (twice of 2 the 2 attempts). ;-) I am running fine with 3.2.14. I have attached
> camera picture of the Oops and retyped just the function names into the email.

BTW, this Oops does NOT happen with 3.3.2 kernel (dmesg attached for comparison).

> 
> 
> Dell Vostro 3550
> 
> dmi_matches
> dmi_check_system
> find_tokens
> dell_init
> staging_init
> find_tokens
> do_one_initcall
> kernel_init
> rdinit_setup
> kernel_thread_helper
> start_kernel
> gs_change
> 
> # lspci
> 00:00.0 Host bridge: Intel Corporation 2nd Generation Core Processor Family DRAM Controller (rev 09)
> 00:02.0 VGA compatible controller: Intel Corporation 2nd Generation Core Processor Family Integrated Graphics Controller (rev 09)
> 00:16.0 Communication controller: Intel Corporation 6 Series/C200 Series Chipset Family MEI Controller #1 (rev 04)
> 00:1a.0 USB controller: Intel Corporation 6 Series/C200 Series Chipset Family USB Enhanced Host Controller #2 (rev 05)
> 00:1b.0 Audio device: Intel Corporation 6 Series/C200 Series Chipset Family High Definition Audio Controller (rev 05)
> 00:1c.0 PCI bridge: Intel Corporation 6 Series/C200 Series Chipset Family PCI Express Root Port 1 (rev b5)
> 00:1c.1 PCI bridge: Intel Corporation 6 Series/C200 Series Chipset Family PCI Express Root Port 2 (rev b5)
> 00:1c.3 PCI bridge: Intel Corporation 6 Series/C200 Series Chipset Family PCI Express Root Port 4 (rev b5)
> 00:1c.4 PCI bridge: Intel Corporation 6 Series/C200 Series Chipset Family PCI Express Root Port 5 (rev b5)
> 00:1c.7 PCI bridge: Intel Corporation 6 Series/C200 Series Chipset Family PCI Express Root Port 8 (rev b5)
> 00:1d.0 USB controller: Intel Corporation 6 Series/C200 Series Chipset Family USB Enhanced Host Controller #1 (rev 05)
> 00:1f.0 ISA bridge: Intel Corporation HM67 Express Chipset Family LPC Controller (rev 05)
> 00:1f.2 SATA controller: Intel Corporation 6 Series/C200 Series Chipset Family 6 port SATA AHCI Controller (rev 05)
> 00:1f.3 SMBus: Intel Corporation 6 Series/C200 Series Chipset Family SMBus Controller (rev 05)
> 05:00.0 Ethernet controller: Realtek Semiconductor Co., Ltd. RTL8111/8168B PCI Express Gigabit Ethernet controller (rev 06)
> 09:00.0 Network controller: Intel Corporation Centrino Wireless-N 1030 (rev 34)
> 0b:00.0 USB controller: Texas Instruments Device 8241 (rev 02)
> #
> 
> Also dmesg is attached of the functional 3.2.14 kernel instance.
> 
> Hope this helps,
> Martin
