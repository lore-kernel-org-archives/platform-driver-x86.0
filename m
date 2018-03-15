From: dvhart@infradead.org
Subject: Re: [PATCH] platform/x86: dell: avoid link error with modular ACPI_SMI
Date: Thu, 15 Mar 2018 11:36:49 -0700
Message-ID: <17477AD6-0C60-40B4-AE86-56FD4AA6208F@infradead.org>
References: <20180315153934.3844276-1-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180315153934.3844276-1-arnd@arndb.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, Andy Shevchenko <andy@infradead.org>
Cc: Mario Limonciello <mario.limonciello@dell.com>, Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org



On March 15, 2018 8:39:07 AM PDT, Arnd Bergmann <arnd@arndb=2Ede> wrote:
>The new DELL_LAPTOP dependencies allowed one configuration that should
>not
>have been possible, with DELL_SMBIOS_WMI built-in, but ACPI_SMI as a
>module:


Hi Arnd, do you have the latest changes from me? The platform-drivers-x86-=
v4=2E16-7 PR to Linus yesterday has a fix for the ACPI_WMI dependency=2E Li=
nus merged it yesterday=2E

--=20
Sent from my Android device with K-9 Mail=2E Please excuse my brevity=2E
