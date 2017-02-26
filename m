From: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Subject: Re: [PATCH 2/2] platform/x86: thinkpad_acpi: add mapping for new
 hotkeys on T470
Date: Sun, 26 Feb 2017 15:48:05 -0300
Message-ID: <20170226184805.GB5747@khazad-dum.debian.net>
References: <20170225182030.19232-1-ckellner@redhat.com>
 <20170225182030.19232-3-ckellner@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:38816 "EHLO
        out4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751214AbdBZSsJ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 26 Feb 2017 13:48:09 -0500
Content-Disposition: inline
In-Reply-To: <20170225182030.19232-3-ckellner@redhat.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Christian Kellner <ckellner@redhat.com>
Cc: Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org

On Sat, 25 Feb 2017, Christian Kellner wrote:
> The T470 emits new hkey events in the 0x1311 - 0x1315 range. According
> to the user manual they should launch a user selected favorite
> application (star icon, 0x1311), snipping tool (0x1312, currently
> ignored), enable/disable bluetooth (0x1314) and open they keyboard
> settings (0x1315).
> 
> The third nibble (0xf00) is used to differentiate between the original
> hotkeys, the adaptive keyboard codes and the new, additional ones.

Looks good.

Acked-by: Henrique de Moraes Holschuh <hmh@hmh.eng.br>

-- 
  Henrique Holschuh
