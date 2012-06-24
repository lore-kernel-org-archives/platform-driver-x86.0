From: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Subject: Re: [PATCH 1/5] thinkpad_acpi: Drop pm_message_t arguments from
 suspend routines
Date: Sat, 23 Jun 2012 21:32:24 -0300
Message-ID: <20120624003224.GA20885@khazad-dum.debian.net>
References: <201206172226.42729.rjw@sisk.pl>
 <201206172227.23591.rjw@sisk.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <201206172227.23591.rjw@sisk.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: "Rafael J. Wysocki" <rjw@sisk.pl>
Cc: platform-driver-x86@vger.kernel.org, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, LKML <linux-kernel@vger.kernel.org>, Linux PM list <linux-pm@vger.kernel.org>, Matthew Garrett <mjg59@srcf.ucam.org>, Joey Lee <jlee@novell.com>
List-Id: platform-driver-x86.vger.kernel.org

On Sun, 17 Jun 2012, Rafael J. Wysocki wrote:
> From: Rafael J. Wysocki <rjw@sisk.pl>
> 
> Multiple suspend routines in drivers/platform/x86/thinkpad_acpi.c
> use take pm_message_t arguments that aren't used by any of them.
> Make those routines take no arguments as that's what they should do.
> 
> Signed-off-by: Rafael J. Wysocki <rjw@sisk.pl>

Someday it might be necessary for some of these routines to differentiate S3
from suspend-to-disk, but I will introduce a parameter when that day comes.

Acked-by: Henrique de Moraes Holschuh <hmh@hmh.eng.br>

-- 
  "One disk to rule them all, One disk to find them. One disk to bring
  them all and in the darkness grind them. In the Land of Redmond
  where the shadows lie." -- The Silicon Valley Tarot
  Henrique Holschuh
