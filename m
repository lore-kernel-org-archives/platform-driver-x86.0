From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v4 0/8] platform/x86: wmi: add WMI support to
Date: Wed, 6 Mar 2019 22:20:39 -0800
Message-ID: <20190307062039.GG44339@wrath>
References: <cover.1550603967.git.2pi@mok.nu>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <cover.1550603967.git.2pi@mok.nu>
Sender: linux-kernel-owner@vger.kernel.org
To: Mattias Jacobsson <2pi@mok.nu>
Cc: andy@infradead.org, mario.limonciello@dell.com, michal.lkml@markovi.net, mjg59@srcf.ucam.org, pali.rohar@gmail.com, yamada.masahiro@socionext.com, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Tue, Feb 19, 2019 at 08:59:48PM +0100, Mattias Jacobsson wrote:
> The kernel provides the macro MODULE_DEVICE_TABLE() which can help
> driver authors to generate the appropriate MODULE_ALIAS() output. The
> WMI device type is currently not supported by MODULE_DEVICE_TABLE().

Thanks Mattias. I have this queued up for testing, and with an ack from
Masahiro for 2/8, I'll pull this in. Thanks for the patches.

-- 
Darren Hart
VMware Open Source Technology Center
