From: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Subject: Re: [PATCH 09/11] platform: thinkpad_acpi: convert to use
 DRIVER_ATTR_RO/RW
Date: Fri, 9 Jun 2017 06:55:50 -0300
Message-ID: <20170609095550.GA4711@khazad-dum.debian.net>
References: <20170609090314.13991-1-gregkh@linuxfoundation.org>
 <20170609090314.13991-9-gregkh@linuxfoundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170609090314.13991-9-gregkh@linuxfoundation.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Fri, 09 Jun 2017, Greg Kroah-Hartman wrote:
> We are trying to get rid of DRIVER_ATTR(), and the thinkpad_acpi
> driver's attributes can be trivially changed to use DRIVER_ATTR_RO() and
> DRIVER_ATTR_RW().
> 
> Cc: Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>
> Cc: Darren Hart <dvhart@infradead.org>
> Cc: Andy Shevchenko <andy@infradead.org>
> Cc: <ibm-acpi-devel@lists.sourceforge.net>
> Cc: <platform-driver-x86@vger.kernel.org>
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Acked-by: Henrique de Moraes Holschuh <hmh@hmh.eng.br>

-- 
  Henrique Holschuh
