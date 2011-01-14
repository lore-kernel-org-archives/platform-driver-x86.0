From: Seth Forshee <seth.forshee@canonical.com>
Subject: Re: [PATCH] thinkpad_acpi: Always report scancodes for hotkeys
Date: Fri, 14 Jan 2011 16:56:38 -0600
Message-ID: <20110114225638.GA2060@thinkpad-t410>
References: <1295042079-4832-1-git-send-email-seth.forshee@canonical.com>
 <20110114222517.GA11207@khazad-dum.debian.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from adelie.canonical.com ([91.189.90.139]:41402 "EHLO
	adelie.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752190Ab1ANW4q (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 14 Jan 2011 17:56:46 -0500
Content-Disposition: inline
In-Reply-To: <20110114222517.GA11207@khazad-dum.debian.net>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Cc: Matthew Garrett <mjg@redhat.com>, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org

On Fri, Jan 14, 2011 at 08:25:17PM -0200, Henrique de Moraes Holschuh wrote:
> On Fri, 14 Jan 2011, Seth Forshee wrote:
> > Some thinkpad hotkeys report key codes like KEY_FN_F8 when something
> > like KEY_VOLUMEDOWN is desired. Always provide the scan codes in
> > addition to the key codes to assist with debugging these issues. Also
> > send the scan code before the key code to match what other drivers do,
> > as some userspace utilities expect this ordering.
> 
> Do I have your word of honour that canonical is not going to start using
> scancodes instead of keycodes in Ubuntu to trigger actions?

That would be silly. The reason for this change is to aid in collecting
the data to update udev's keymaps for non-standard keys (see [1]). udev
uses the EVIOCSKEYCODE ioctl to associate the correct key code with the
scan codes. We don't intend to use scan codes instead of key codes.

[1] http://git.kernel.org/?p=linux/hotplug/udev.git;a=blob;f=extras/keymap/README.keymap.txt;hb=HEAD
