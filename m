From: "Ma, Stephen B." <stephen.ma@hp.com>
Subject: Problem: Not receiving data from be2net interfaces inside virtual
 machines
Date: Tue, 17 Jul 2012 23:32:20 +0000
Message-ID: <36AF4B62444F4B4FB04EDD1FDAE1CF1D488A955E@G4W3209.americas.hpqcorp.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from g1t0029.austin.hp.com ([15.216.28.36]:48864 "EHLO
	g1t0029.austin.hp.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755487Ab2GQXdr convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 17 Jul 2012 19:33:47 -0400
Received: from G1W0400.americas.hpqcorp.net (g1w0400.americas.hpqcorp.net [16.236.31.10])
	(using TLSv1 with cipher RC4-MD5 (128/128 bits))
	(No client certificate requested)
	by g1t0029.austin.hp.com (Postfix) with ESMTPS id 88C81382CC
	for <platform-driver-x86@vger.kernel.org>; Tue, 17 Jul 2012 23:33:46 +0000 (UTC)
Content-Language: en-US
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>

Hello,

I have created a KVM Virtual machine containing a Virtual function from a Emulex NC553 Physical function.  I am unable to ping to other machines on the network.  

I have tried using Fedora 17 and RHEL6.3.  On these OS's, "ifconfig eth<X>" on the virtual functions shows there are bytes being transmitted.  But the eth<X> is receiving 0 bytes.  Dmesg shows be2net driver emitted these messages (in the VM, the be2net device is at 00:09.0) as the ping is going on:

On RHEL6.2, I am able to ping successfully to the other machines.

be2net 0000:00:09.0: This domain(VM) is not permitted to execute this cmd (opcode 34)
be2net 0000:00:09.0: This domain(VM) is not permitted to execute this cmd (opcode 34)
be2net 0000:00:09.0: This domain(VM) is not permitted to execute this cmd (opcode 34)
be2net 0000:00:09.0: This domain(VM) is not permitted to execute this cmd (opcode 34)
be2net 0000:00:09.0: This domain(VM) is not permitted to execute this cmd (opcode 34)

Anybody knows how to resolve this problem? Is there a newer be2net driver that fix this problem?


Driver version info in RHEL6.3:

# modinfo be2net
filename:       /lib/modules/2.6.32-279.el6.x86_64/kernel/drivers/net/benet/be2net.ko
license:        GPL
author:         ServerEngines Corporation
description:    ServerEngines BladeEngine 10Gbps NIC Driver 4.1.307r
version:        4.1.307r
srcversion:     7076CA6C80C3CD968BAFFFC
alias:          pci:v000010DFd00000720sv*sd*bc*sc*i*
alias:          pci:v000010DFd0000E228sv*sd*bc*sc*i*
alias:          pci:v000010DFd0000E220sv*sd*bc*sc*i*
alias:          pci:v000019A2d00000710sv*sd*bc*sc*i*
alias:          pci:v000019A2d00000700sv*sd*bc*sc*i*
alias:          pci:v000019A2d00000221sv*sd*bc*sc*i*
alias:          pci:v000019A2d00000211sv*sd*bc*sc*i*
depends:
vermagic:       2.6.32-279.el6.x86_64 SMP mod_unload modversions
parm:           num_vfs:Number of PCI VFs to initialize (uint)
parm:           multi_rxq:Obsolete and used only for compatibility (bool)
parm:           rx_frag_size:Size of a fragment that holds rcvd data. (ushort)

The VM is running on a HP BL460 G7 blade.  
