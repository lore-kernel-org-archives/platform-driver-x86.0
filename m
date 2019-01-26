From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] platform/x86: wmi: fix potential null pointer
 dereferences
Date: Sat, 26 Jan 2019 12:43:55 -0800
Message-ID: <20190126204355.GA13882@wrath>
References: <20190122200302.19861-1-2pi@mok.nu>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190122200302.19861-1-2pi@mok.nu>
Sender: linux-kernel-owner@vger.kernel.org
To: Mattias Jacobsson <2pi@mok.nu>
Cc: andy@infradead.org, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Tue, Jan 22, 2019 at 09:03:01PM +0100, Mattias Jacobsson wrote:
> In the function wmi_dev_match() there are three variables that
> potentially can result in a null pointer dereference. Namely:

Is this something you have observed? This gets called when a new driver
registered for each unassociated device on the bus, so I'm not
immediately seeing how dev or driver would end up being NULL here.

See: Documentation/driver-model/bus.txt

-- 
Darren Hart
VMware Open Source Technology Center
