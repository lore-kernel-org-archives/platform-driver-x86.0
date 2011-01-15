From: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Subject: Re: [PATCH] thinkpad_acpi: Always report scancodes for hotkeys
Date: Sat, 15 Jan 2011 00:13:05 -0200
Message-ID: <20110115021305.GB26913@khazad-dum.debian.net>
References: <1295042079-4832-1-git-send-email-seth.forshee@canonical.com>
 <20110114222517.GA11207@khazad-dum.debian.net>
 <20110114225638.GA2060@thinkpad-t410>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from out1.smtp.messagingengine.com ([66.111.4.25]:35096 "EHLO
	out1.smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751824Ab1AOCNJ (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 14 Jan 2011 21:13:09 -0500
Content-Disposition: inline
In-Reply-To: <20110114225638.GA2060@thinkpad-t410>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Seth Forshee <seth.forshee@canonical.com>
Cc: Matthew Garrett <mjg@redhat.com>, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org

On Fri, 14 Jan 2011, Seth Forshee wrote:
> > Do I have your word of honour that canonical is not going to start using
> > scancodes instead of keycodes in Ubuntu to trigger actions?
> 
> That would be silly. The reason for this change is to aid in collecting

...

> the data to update udev's keymaps for non-standard keys (see [1]). udev
> uses the EVIOCSKEYCODE ioctl to associate the correct key code with the
> scan codes. We don't intend to use scan codes instead of key codes.

Very well.  I *will* hold you to that.  I do not want a repeat of the
KEY_VOLUMEUP/DOWN "active notification" fiasco.

Acked-by: Henrique de Moraes Holschuh <hmh@hmh.eng.br>

-- 
  "One disk to rule them all, One disk to find them. One disk to bring
  them all and in the darkness grind them. In the Land of Redmond
  where the shadows lie." -- The Silicon Valley Tarot
  Henrique Holschuh
