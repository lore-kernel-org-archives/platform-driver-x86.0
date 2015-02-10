From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH resend 5/6] toshiba_acpi: Add support to enable/disable
 USB 3
Date: Mon, 9 Feb 2015 20:11:38 -0800
Message-ID: <20150210041138.GC37927@fury.dvhart.com>
References: <1423539294-2941-1-git-send-email-coproscefalo@gmail.com>
 <1423539294-2941-6-git-send-email-coproscefalo@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1423539294-2941-6-git-send-email-coproscefalo@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Azael Avalos <coproscefalo@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Mon, Feb 09, 2015 at 08:34:53PM -0700, Azael Avalos wrote:
> Toshiba laptops that come with USB 3 ports have a feature that lets
> them disable USB 3 functionality and act as a regular USB 2 port, and
> thus, saving power.
> 
> This patch adds support to that feature, by creating a sysfs entry
> named "usb_three", acceptig only two parameters, 0 to disable the
> USB 3 (acting as a USB 2) and 1 to enable it.
> 

Similar question, does the system BIOS allow you to configure this setting? If
so, what would be the value for enabling it in the OS directly?

-- 
Darren Hart
Intel Open Source Technology Center
