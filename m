From: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Subject: Re: [PATCH] thinkpad_acpi: Always report scancodes for hotkeys
Date: Fri, 14 Jan 2011 20:25:17 -0200
Message-ID: <20110114222517.GA11207@khazad-dum.debian.net>
References: <1295042079-4832-1-git-send-email-seth.forshee@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from out1.smtp.messagingengine.com ([66.111.4.25]:46952 "EHLO
	out1.smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752562Ab1ANWZW (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 14 Jan 2011 17:25:22 -0500
Content-Disposition: inline
In-Reply-To: <1295042079-4832-1-git-send-email-seth.forshee@canonical.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Seth Forshee <seth.forshee@canonical.com>
Cc: Matthew Garrett <mjg@redhat.com>, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org

On Fri, 14 Jan 2011, Seth Forshee wrote:
> Some thinkpad hotkeys report key codes like KEY_FN_F8 when something
> like KEY_VOLUMEDOWN is desired. Always provide the scan codes in
> addition to the key codes to assist with debugging these issues. Also
> send the scan code before the key code to match what other drivers do,
> as some userspace utilities expect this ordering.

Do I have your word of honour that canonical is not going to start using
scancodes instead of keycodes in Ubuntu to trigger actions?

-- 
  "One disk to rule them all, One disk to find them. One disk to bring
  them all and in the darkness grind them. In the Land of Redmond
  where the shadows lie." -- The Silicon Valley Tarot
  Henrique Holschuh
