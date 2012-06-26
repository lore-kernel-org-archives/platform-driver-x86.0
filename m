From: Jonathan Nieder <jrnieder@gmail.com>
Subject: Re: [PATCH] asus-wmi: use ASUS_WMI_METHODID_DSTS2 as default DSTS ID.
Date: Tue, 26 Jun 2012 16:39:58 -0500
Message-ID: <20120626213958.GA17871@burratino>
References: <1340164055-1062-1-git-send-email-alex.hung@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-gh0-f174.google.com ([209.85.160.174]:48396 "EHLO
	mail-gh0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750893Ab2FZVkG (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 26 Jun 2012 17:40:06 -0400
Content-Disposition: inline
In-Reply-To: <1340164055-1062-1-git-send-email-alex.hung@canonical.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Alex Hung <alex.hung@canonical.com>
Cc: corentincj@iksaif.net, mjg@redhat.com, acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Alex,

Alex Hung wrote:

> According to responses from the BIOS team, ASUS_WMI_METHODID_DSTS2
> (0x53545344) will be used as future DSTS ID. In addition, calling
> asus_wmi_evaluate_method(ASUS_WMI_METHODID_DSTS2, 0, 0, NULL) returns
> ASUS_WMI_UNSUPPORTED_METHOD in new ASUS laptop PCs. This patch fixes
> no DSTS ID will be assigned in this case.

 Tested-by: Carsten Otto <otto@informatik.rwth-aachen.de> # 3.2.21, Asus UX31A

More precisely, Carsten was unable to use asus_wmi, getting the
following message from a distro kernel based on 3.4.1 and from
unpatched 3.2.21:[1]

| asus_wmi: Can't find DSTS

After applying the patch described above to 3.2.21, multimedia keys
work.

| The patch works, dmesg before and after are attached.
|
| With the patched kernel I can (at least) change the volume using the
| Fn keys, gnome shows some audio related icons and a changing (volume)
| bar. I did not try further than that (yet).

This is on an Asus Zenbook Prime (UX31A).  acpidump, logs, and other
info are at [1].  Could you remind me when this hits mainline so we
can make sure it gets applied to earlier kernels, for example by
adding "Cc: stable@vger.kernel.org" to the commit message?

Thanks and hope that helps,
Jonathan

[1] http://bugs.debian.org/679158
