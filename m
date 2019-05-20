From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v5 1/2] platform/mellanox: Add bootctl driver for
 Mellanox BlueField Soc
Date: Mon, 20 May 2019 21:12:09 +0200
Message-ID: <20190520191209.GA29776@kroah.com>
References: <0b74e9ad12360b56bc0a3c2ca972798c424f2610.1548790896.git.lsun@mellanox.com>
 <1558115345-32476-1-git-send-email-lsun@mellanox.com>
 <20190520155658.GA14165@kroah.com>
 <DB6PR05MB32232CA5DD05D1A923A28215A1060@DB6PR05MB3223.eurprd05.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <DB6PR05MB32232CA5DD05D1A923A28215A1060@DB6PR05MB3223.eurprd05.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Liming Sun <lsun@mellanox.com>
Cc: Andy Shevchenko <andy@infradead.org>, Darren Hart <dvhart@infradead.org>, Vadim Pasternak <vadimp@mellanox.com>, David Woods <dwoods@mellanox.com>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Mon, May 20, 2019 at 06:07:44PM +0000, Liming Sun wrote:
> > > +static struct platform_driver mlxbf_bootctl_driver = {
> > > +	.probe = mlxbf_bootctl_probe,
> > > +	.driver = {
> > > +		.name = "mlxbf-bootctl",
> > > +		.groups = mlxbf_bootctl_groups,
> > > +		.acpi_match_table = mlxbf_bootctl_acpi_ids,
> > 
> > Why is an acpi driver a platform driver?  Isn't there a "real" acpi
> > driver interface you should be tieing into instead?
> > 
> > Only use a platform driver as an absolute last resort.  I don't think
> > that is the case here.
> 
> The driver is trying to configure boot-swapping and display secure state,
> and is defined/initiated in ACPI table in UEFI. It seems a little hard to
> categorize this driver to any existing subsystem. Any suggestion
> where it might be a better fit (like drivers/misc, drivers/firmware, etc)? 
> Please correct me if I misunderstand the comments. Thanks!.

The comment was asking why an acpi driver is a platform driver, but then
I went and looked now at a bunch of acpi drivers, and they all are
platform drivers :(

Anyway, drivers/acpi/ seems like the best place for this file, right?

thanks,

greg k-h
