From: "Rafael J. Wysocki" <rjw@sisk.pl>
Subject: Re: [PATCH 2/5] thinkpad_acpi: Use struct dev_pm_ops instead of legacy PM routines
Date: Sun, 24 Jun 2012 22:01:32 +0200
Message-ID: <201206242201.32250.rjw@sisk.pl>
References: <201206172226.42729.rjw@sisk.pl> <201206172227.57189.rjw@sisk.pl> <20120624003416.GB20885@khazad-dum.debian.net>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20120624003416.GB20885@khazad-dum.debian.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Cc: platform-driver-x86@vger.kernel.org, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, LKML <linux-kernel@vger.kernel.org>, Linux PM list <linux-pm@vger.kernel.org>, Matthew Garrett <mjg59@srcf.ucam.org>, Joey Lee <jlee@novell.com>
List-Id: platform-driver-x86.vger.kernel.org

On Sunday, June 24, 2012, Henrique de Moraes Holschuh wrote:
> On Sun, 17 Jun 2012, Rafael J. Wysocki wrote:
> > From: Rafael J. Wysocki <rjw@sisk.pl>
> > 
> > Make the thinkpad_acpi driver define its PM callbacks through
> > a struct dev_pm_ops object rather than by using legacy PM hooks
> > in struct platform_driver.
> > 
> > Signed-off-by: Rafael J. Wysocki <rjw@sisk.pl>
> 
> Acked-by: Henrique de Moraes Holschuh <hmh@hmh.eng.br>

Thanks (and for the other patch too)!

Rafael
