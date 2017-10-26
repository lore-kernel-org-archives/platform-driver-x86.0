From: Alan Cox <gnomes@lxorguk.ukuu.org.uk>
Subject: Re: [PATCH] platform/x86: dell-uart-backlight: new backlight driver
 for DELL AIO
Date: Thu, 26 Oct 2017 17:10:11 +0100
Message-ID: <20171026171011.3eca122e@alans-desktop>
References: <1509004429-1596-1-git-send-email-acelan.kao@canonical.com>
        <08add166d5b34992ba167a878ca2a808@ausx13mpc124.AMER.DELL.COM>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <08add166d5b34992ba167a878ca2a808@ausx13mpc124.AMER.DELL.COM>
Sender: linux-kernel-owner@vger.kernel.org
To: Mario.Limonciello@dell.com
Cc: acelan.kao@canonical.com, dvhart@infradead.org, andy@infradead.org, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org


> > +static int __init dell_uart_bl_init(void)
> > +{
> > +	ftty = filp_open("/dev/ttyS0", O_RDWR | O_NOCTTY | O_NDELAY, 0);  
> 

You have no idea what name is assigned. This doesn't work.

This isn't the way to do it any more because the 'tty from kernel'
problem finally got fixed. You can attach it as a serdev directly to the
kernel.

Take a look at serdev_tty_port_register/serdev_tty_port_unreg

Alan
