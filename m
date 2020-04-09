From: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Subject: Re: [PATCH] platform/x86: intel_int0002_vgpio: Only bind to the INT0002 dev when using s2idle
Date: Thu, 09 Apr 2020 11:35:32 +0200
Message-ID: <3029333.72LCz6h3O1@kreacher>
References: <20200407213058.62870-1-hdegoede@redhat.com> <cfd3171a-94fb-7382-28e1-a236cb6759cc@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <cfd3171a-94fb-7382-28e1-a236cb6759cc@redhat.com>
Sender: stable-owner@vger.kernel.org
To: Hans de Goede <hdegoede@redhat.com>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Maxim Mikityanskiy <maxtram95@gmail.com>, "5 . 3+" <stable@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Wednesday, April 8, 2020 12:23:53 AM CEST Hans de Goede wrote:
> Hi all,
> 
> I just realized that I should have added a cover letter to this
> patch to discuss how to merge it.
> 
> Rafael has already queued up the
> "[PATCH v3 2/2] platform/x86: intel_int0002_vgpio: Use acpi_register_wakeup_handler()"

This has been merged by Linus already.

> in his tree. Looking at both patches the parts of the file the
> touch are different enough that that should not be a problem though.
> 
> So I guess this can go through platform/x86 as usual, or
> (assuming everyone is ok with the change itself) alternatively
> Rafael can take it to make sure there will be no conflicts?

Just merge it through platform-x86.

Cheers!
