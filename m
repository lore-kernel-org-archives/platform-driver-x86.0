From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: Tree for May 23 (asus-wmi)
Date: Thu, 23 May 2013 09:13:29 -0700
Message-ID: <519E4029.5090101@infradead.org>
References: <20130523154924.db69d92fe88f9d22a87e822d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
In-Reply-To: <20130523154924.db69d92fe88f9d22a87e822d@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Corentin Chary <corentin.chary@gmail.com>, Platform Driver <platform-driver-x86@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On 05/22/13 22:49, Stephen Rothwell wrote:
> Hi all,
> 
> There will be no linux-next release tomorrow.
> 
> Changes since 20130522:
> 


when CONFIG_ACPI_VIDEO=m and ASUS_WMI=y:

drivers/built-in.o: In function `asus_wmi_add':
asus-wmi.c:(.text+0x252514): undefined reference to `acpi_video_unregister'


-- 
~Randy
