From: "H. Peter Anvin" <hpa@linux.intel.com>
Subject: Re: [PATCH v2 3/5] toshiba_acpi: Fix accelerometer direction reporting
Date: Mon, 15 Sep 2014 14:01:23 -0700
Message-ID: <541753A3.8010102@linux.intel.com>
References: <1410569437-3066-1-git-send-email-coproscefalo@gmail.com> <1410569437-3066-2-git-send-email-coproscefalo@gmail.com> <20140915192923.GA61529@vmdeb7> <20140915195617.GA3652@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20140915195617.GA3652@kroah.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Darren Hart <dvhart@infradead.org>
Cc: Azael Avalos <coproscefalo@gmail.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, "Rafael J. Wysocki" <rjw@rjwysocki.net>
List-Id: platform-driver-x86.vger.kernel.org

On 09/15/2014 12:56 PM, Greg Kroah-Hartman wrote:
> 
>> I have also suggested this device (2 actually) would be better supported as an
>> IIO accelerometer device, but even that would change the sysfs interface by
>> removing these altogether and using the IIO standardized path and accelerometer
>> interface.
> 
> That's a better goal overall, then the "odd" sysfs files are now gone,
> to be replaced with the standard interface which all tools should
> already be using.
> 

I would definitely agree with that, although I understood there were
technical concerns with that?

	-hpa
